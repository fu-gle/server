from django.shortcuts import render
from django.http import HttpResponse
import json, decimal
from toondere import models
from numpy import zeros
from django.core.paginator import InvalidPage, Paginator
from toondere.RecommendationSystem import Recommend,PredictRatings,UserTaste
from django.http import Http404
from django.db import connection
from collections import namedtuple
import operator, random
import time


#메인

print('views.py 실행')
numofUsers = models.User.objects.count()
numofWebtoons = models.Webtoon.objects.count()
numofStars = models.Star.objects.count()
starData = models.Star.objects.all()

userbyWebtoons = zeros((numofUsers, numofWebtoons))

for i in range(numofStars):
    userbyWebtoons[starData[i].user.id - 1]\
                  [starData[i].webtoon.id - 1] = \
                        starData[i].star

# 작가별 랭킹계산
def author_rank(request):

    author_list = author_not_dup()

    cursor = connection.cursor()

    cursor.execute("""select id, author, starsum, cnt from toondere_webtoon A, (select webtoon_id, sum(star) as starsum , count(webtoon_id) as cnt from toondere_star group by webtoon_id) B where A.id = B.webtoon_id""")

    data = dictfetchall(cursor)

    for d in data:
        temp = []
        s = d["author"]

        authors = s.split(',')

        for a in authors:
            for e in author_list:
                # if a.find(e[0]) != -1:
                if a == e[0]:
                    e[1] += d["starsum"]
                    e[2] += d["cnt"]

    for a in author_list:
        if not a[2] == 0:
            a[1] /= a[2]

    sort_sum = sorted(sorted(sorted(author_list, key=lambda x: x[0]),
                          key=lambda x: x[2], reverse=True),
                   key=lambda x: x[1], reverse=True)
    sum_l = []
    for s in sort_sum[: 30]:
        sum_d = {}
        sum_d["author"] = s[0]
        sum_d["average"] = s[1] * 100
        sum_d["count"] = s[2]

        sum_l.append(sum_d)

    sort_count = sorted(sorted(sorted(author_list, key=lambda x: x[0]),
                          key=lambda x: x[1], reverse=True),
                   key=lambda x: x[2], reverse=True)
    count_l = []
    for s in sort_count[: 30]:
        count_d = {}
        count_d["author"] = s[0]
        count_d["average"] = s[1] * 100
        count_d["count"] = s[2]

        count_l.append(count_d)

    l = count_l + sum_l
    j = json.dumps(l, ensure_ascii=False)


    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 작가 중복 안되는 리스트
def author_not_dup():
    t = models.Webtoon.objects.values_list('author', flat =True)

    not_dup_list = []
    for a in t:
        s = a.split(',')
        for t in s:
            t.replace(', ', ',')
            temp = [0, 0, 0]
            temp[0] = t
            if temp[0] == ".." or temp[0] == '' or temp in not_dup_list:
                continue
            not_dup_list.append(temp)

    return not_dup_list

# raw 쿼리 날린 결과를 사전 형식으로 바꿔주는 함수
def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

# 웹툰 평가 하기 페이지
def webtoon_evaluate(request):

    media = request.POST.get('media')
    userId = request.POST.get('userId')
    starData = models.Star.objects.filter(user_id=userId)

    cursor = connection.cursor()

    if(media == None):
        print("필터적용 x")
        cursor.execute("""select A.id, title, author, genre, tags, summary, media, publish, adult, thumbnail_big, link, thumbnail_small, C.like, is_cartoon from toondere_webtoon A left join toondere_likewebtoon C on A.id = C.webtoon_id and user_id = %s where not exists (select * from toondere_star B where user_id = %s and A.id = B.webtoon_id order by random()) and is_cartoon = false""", (userId, userId))

    else:
        print("필터적용 o")
        cursor.execute("""select A.id, title, author, genre, tags, summary, media, publish, adult, thumbnail_big, link, thumbnail_small, C.like, is_cartoon from toondere_webtoon A left join toondere_likewebtoon C on A.id = C.webtoon_id and user_id = %s where not exists (select * from toondere_star B where user_id = %s and A.id = B.webtoon_id) and A.media = %s and is_cartoon = false order by random()""", (userId, userId, media))


    data = dictfetchall(cursor)


    pageNo = request.POST.get('pageNo',1)
    serialized = []
    paginator = Paginator(data,10)
    try:
        #pageNo에 해당하는 페이지호출
        page = paginator.page(pageNo)
    except InvalidPage:
        raise Http404('invaild page {}'.format(pageNo))

    for d in page.object_list:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False)


    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 만화책 평가 하기 페이지
def cartoon_evaluate(request):

    userId = request.POST.get('userId')
    starData = models.Star.objects.filter(user_id=userId)

    cursor = connection.cursor()


    cursor.execute("""select A.id, title, author, genre, tags, summary, media, publish, adult, thumbnail_big, link, thumbnail_small, C.like, is_cartoon from toondere_webtoon A left join toondere_likewebtoon C on A.id = C.webtoon_id and user_id = %s where not exists (select * from toondere_star B where user_id = %s and A.id = B.webtoon_id order by random()) and is_cartoon = true""", (userId, userId))


    data = dictfetchall(cursor)


    pageNo = request.POST.get('pageNo',1)
    serialized = []
    paginator = Paginator(data,10)
    try:
        #pageNo에 해당하는 페이지호출
        page = paginator.page(pageNo)
    except InvalidPage:
        raise Http404('invaild page {}'.format(pageNo))

    for d in page.object_list:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False)


    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 별점 매기기 함수
def star_insert(request):
    if request.method == 'POST':

        webtoonId = request.POST.get('webtoonId')
        star = request.POST.get('star')
        userId = request.POST.get('userId')
        #별점을 메겼는지 확인
        exist = models.Star.objects.filter(user=userId).\
        filter(webtoon=webtoonId)

        if(exist):
            print("별점 중복 O")

            if(star == '0' ):
                print("삭제")
                exist.delete()
            else:
                exist[0].star = star
                exist[0].save()

        else:
            print("별점 중복 X")
            webtoonContent = models.Webtoon.objects.get(id=webtoonId)
            userContent = models.User.objects.get(id=userId)
            print("------------------->"+str(webtoonId) + str(star) + str(userId))
            p = models.Star(webtoon=webtoonContent, star=star, user=userContent)

            p.save()

        userbyWebtoons[int(userId)-1][int(webtoonId)-1] = star
    return render(request, 'toondere/post_insert.html',{})

# 안씀
# def webtoon_list(request):

#     genreList = []

#     genre = models.Webtoon.objects.values_list('genre', flat =True)

#     allData = models.Webtoon.objects.all()
#     starData = models.Star.objects.all()
#     numofUsers = models.User.objects.count()
#     numofWebtoons = models.Webtoon.objects.count()
#     numofStars = models.Star.objects.count()


#     userbyWebtoons = zeros((numofUsers, numofWebtoons))

#     for i in range(numofStars):
#         userbyWebtoons[starData[i].user.id-1][starData[i].webtoon.id-1] = \
#             starData[i].star

#     for i in genre:
#         splitItem = i.split(',')

#         for j in splitItem:
#             genreList.append(j)

#     genreSet = set(genreList)
#     genreSet.remove('')
#     genreSet = sorted(genreSet)


#     genreDict = {}

#     index = 0
#     for g in genreSet:
#         genreDict[g] = index
#         index += 1

#     resultDict = {}
#     for i in range(index):
#         resultDict[i] = []

#     for webtoon in allData:
#         tempList = webtoon.genre.split(',')
#         for t in tempList:
#             if t != None and t != '':
#                 resultDict[genreDict[t]].append(webtoon.id - 1)



#     f = open("test", "wt", encoding="utf-8")
#     f.write(str(resultDict))
#     f.close()


#     return HttpResponse(resultDict)

# 카톡/ 페이스북 로그인
def userLogin(request):
    global userbyWebtoons

    if request.method == 'POST':


        primary = request.POST.get('primary')
        name = request.POST.get('name')
        password = request.POST.get('password')
        message = request.POST.get('message')
        profile = request.POST.get('profile')
        User = models.User.objects.filter(primary = primary)


        if(User):
            print("중복 O-->"+str(primary) + str(name) + \
                str(profile) + str(password) + str(message))


        else:

            print("중복 X-->"+str(primary) + str(name) + \
                str(profile) + str(password) + str(message))

            p = models.User(primary=primary, name=name, profile=profile, password=password, message=message)
            p.save()
            User = models.User.objects.filter(primary = primary)
            # 사용자 추가 될때 열 하나 추가
            print(userbyWebtoons.shape[0])
            userbyWebtoons = Recommend.addUserRow(userbyWebtoons,1)
            print(userbyWebtoons.shape[0])

        # 로그인 한 유저의 평가한 정보를 가져옴
        userId = User[0].id
        cursor = connection.cursor()
        cursor.execute("""select (select count(*) from toondere_star C, toondere_webtoon D where C.webtoon_id = D.id and user_id=%s and is_cartoon =TRUE) as cartooncount, (select count(*) from toondere_star C, toondere_webtoon D where C.webtoon_id = D.id and user_id=%s and is_cartoon =FALSE) as webtooncount, (select count(*) from toondere_likewebtoon A where user_id= %s and A.like =true) as likecount, (select count(*) from toondere_dontseewebtoon A where user_id= %s and A.dontsee = true) as dontseecount;""", (userId, userId, userId, userId));
        serialized = []
        data = dictfetchall(cursor)

        for d in data:

            serialized.append(d)


        user = User[0].serialize()

        serialized.append(user)
        j = json.dumps(serialized, ensure_ascii=False)

    return HttpResponse(j, content_type='application/json; charset=utf-8')


# 자신이 평가한 웹툰리스트
def my_webtoon_star(request):
    userId = request.POST.get('userId')

    cursor = connection.cursor()

    cursor.execute(""" select A.id, title, author, genre, tags, summary, media, publish, adult, thumbnail_big, link, thumbnail_small, C.like, B.star, is_cartoon from toondere_webtoon A left join toondere_likewebtoon C  on A.id = C.webtoon_id and user_id = %s, (select * from toondere_star where user_id = %s) B where A.id = B.webtoon_id and A.is_cartoon = false""",(userId, userId))

    data = dictfetchall(cursor)

    pageNo = request.POST.get('pageNo',1)
    serialized = []
    paginator = Paginator(data,10)
    try:
        #pageNo에 해당하는 페이지호출
        page = paginator.page(pageNo)
    except InvalidPage:
        raise Http404('invaild page {}'.format(pageNo))

    for d in page.object_list:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 자신이 평가한 만화리스트
def my_cartoon_star(request):
    userId = request.POST.get('userId')

    cursor = connection.cursor()

    cursor.execute(""" select A.id, title, author, genre, tags, summary, media, publish, adult, thumbnail_big, link, thumbnail_small, C.like, B.star, is_cartoon from toondere_webtoon A left join toondere_likewebtoon C  on A.id = C.webtoon_id and user_id = %s, (select * from toondere_star where user_id = %s) B where A.id = B.webtoon_id and A.is_cartoon = true""",(userId, userId))

    data = dictfetchall(cursor)

    pageNo = request.POST.get('pageNo',1)
    serialized = []
    paginator = Paginator(data,10)
    try:
        #pageNo에 해당하는 페이지호출
        page = paginator.page(pageNo)
    except InvalidPage:
        raise Http404('invaild page {}'.format(pageNo))

    for d in page.object_list:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 보기싫은 웹툰 리스트
def mydontsee(request):
    userId = request.POST.get('userId')

    cursor = connection.cursor()

    cursor.execute(""" select A.id, title, author, genre, tags, summary, media, publish, adult, thumbnail_big, link, thumbnail_small, B.dontsee, C.star, is_cartoon from toondere_webtoon A, (select * from toondere_dontseewebtoon where user_id = %s and dontsee = true) B left join (select * from toondere_star where user_id = %s) C on B.webtoon_id = C.webtoon_id where A.id = B.webtoon_id""",(userId, userId))

    data = dictfetchall(cursor)

    pageNo = request.POST.get('pageNo',1)
    serialized = []
    paginator = Paginator(data,10)
    try:
        #pageNo에 해당하는 페이지호출
        page = paginator.page(pageNo)
    except InvalidPage:
        raise Http404('invaild page {}'.format(pageNo))

    for d in page.object_list:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 상세페이지
def detail(request):

    genreList = []
    allData = models.Webtoon.objects.all()
    webtoonId = request.POST.get('webtoonId')
    userId = request.POST.get('userId')

    genre = models.Webtoon.objects.values_list('genre', flat =True)

    # 장르 자르기
    for i in genre:
        splitItem = i.split(',')

        for j in splitItem:
            genreList.append(j)

    genreSet = set(genreList)
    genreSet.remove('')
    genreSet = sorted(genreSet)


    genreDict = {}

    index = 0
    for g in genreSet:
        genreDict[g] = index
        index += 1

    resultDict = {}
    for i in range(index):
        resultDict[i] = set()

    for webtoon in allData:
        tempList = webtoon.genre.split(',')
        for t in tempList:
            if t != None and t != '':
                resultDict[genreDict[t]].add(webtoon.id - 1)


    rating = Recommend.predictRatingToon(
                resultDict, userbyWebtoons, userId, webtoonId)



    cursor = connection.cursor()
    cursor.execute("""select A.id, title, author, genre, tags, summary, media, publish, adult, thumbnail_big, link, thumbnail_small, C.like, B.star, D.average*100 as average, is_cartoon from toondere_webtoon A left join toondere_likewebtoon C on A.id = C.webtoon_id and user_id = {0} left outer join (select webtoon_id, star from toondere_star B where B.user_id ={1}) B on A.id = B.webtoon_id left join (select webtoon_id, round(avg(star),2) as average from toondere_webtoon A, toondere_star B where A.id = B.webtoon_id and webtoon_id = {2} group by webtoon_id) D on A.id = D.webtoon_id where A.id = {3}""".format(userId,userId,webtoonId,webtoonId))
    data = dictfetchall(cursor)

    serialized = []

    for d in data:
        d['recommendStar'] = rating
        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)



    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 추천페이지
def recommend(request):

    genreList = []
    userId = request.POST.get('userId')
    genre = models.Webtoon.objects.values_list('genre', flat =True)
    allData = models.Webtoon.objects.all()

    pageNo = request.POST.get('pageNo',1)


    for i in genre:
        splitItem = i.split(',')

        for j in splitItem:
            genreList.append(j)

    genreSet = set(genreList)
    genreSet.remove('')
    genreSet = sorted(genreSet)


    genreDict = {}

    index = 0
    for g in genreSet:
        genreDict[g] = index
        index += 1

    resultDict = {}
    for i in range(index):
        resultDict[i] = set()



    for webtoon in allData:
        tempList = webtoon.genre.split(',')
        for t in tempList:
            if t != None and t != '':
                resultDict[genreDict[t]].add(webtoon.id - 1)



    fromSimilars = Recommend.recommendfromSimilars(
                                resultDict, userbyWebtoons, userId)
    # fromGenres = Recommend.recommendfromGenre(
                                    # resultDict, userbyWebtoons, 1)

    param = ''
    for i in range(len(fromSimilars)):
        param += str(fromSimilars[i][0])
        if(i < len(fromSimilars)-1):
            param +=','



    if not param:
        print("유사 없음")

        return render(request, 'toondere/nomatch.html',{})


    else:
        print("유사 있음")
        cursor = connection.cursor()
        cursor.execute("""select A.id, title, author, genre, tags, summary, media, publish, adult, thumbnail_big, link, thumbnail_small, C.like, is_cartoon from toondere_webtoon A left join toondere_likewebtoon C on A.id = C.webtoon_id and user_id = {0} where A.id in ({1}) and A.id not in (select coalesce(webtoon_id,0) from toondere_dontseewebtoon where user_id={2} and dontsee = true)""".format(userId,param,userId))
        data = dictfetchall(cursor)



        serialized = []
        pageSerialized = []


        similar = [x[0] for x in fromSimilars]

        for d in data:

            ind = similar.index(d['id'])

            d['recommendStar'] = fromSimilars[ind][1]

            serialized.append(d)

        tagList = []
        temp_tagList = []
        dup_tagList = []

        for d in data:
            tagList.append(d['tags'])

        tagSet = set(tagList)
        temp_tagList = list(filter(None.__ne__, tagSet))

        for i in temp_tagList:

            splitItem = i.split(',')

            for j in splitItem:
                dup_tagList.append(j)


        tagSet = set(dup_tagList)
        tagSet.remove('')
        randomSet = random.sample(tagSet, 8)

        resultTagList = []
        for i in randomSet:
            t = {}
            t['tag'] = i
            resultTagList.append(t)






        paginator = Paginator(serialized,10)
        try:
            #pageNo에 해당하는 페이지호출
            page = paginator.page(pageNo)

        except InvalidPage:
            raise Http404('invaild page {}'.format(pageNo))


        for d in page.object_list:

            pageSerialized.append(d)


        resultDict = {}
        resultDict['webtoon'] = pageSerialized
        resultDict['tags'] = resultTagList


        j = json.dumps(resultDict, ensure_ascii=False)



        return HttpResponse(j, content_type='application/json; charset=utf-8')




# 보고 싶어요 누르기
def like(request):
    webtoonId = request.POST.get('webtoonId')
    userId = request.POST.get('userId')

     #좋아요 눌렀는지 확인
    exist = models.LikeWebtoon.objects.filter(user=userId).\
    filter(webtoon=webtoonId)

    if(exist):
        print("좋아요 중복 O")

        if(exist[0].like == True):
            exist[0].like = False
            exist[0].save()
        else:
            exist[0].like = True
            exist[0].save()

    else:
        print("좋아요 중복 X")

        webtoonContent = models.Webtoon.objects.get(id=webtoonId)
        userContent = models.User.objects.get(id=userId)

        p = models.LikeWebtoon(webtoon=webtoonContent, \
            user=userContent, like = 1)
        p.save()
    return render(request, 'toondere/post_insert.html',{})

# 보고싶어요 웹툰 리스트
def mylike(request):
    userId = request.POST.get('userId')

    cursor = connection.cursor()

    cursor.execute(""" select A.id, title, author, genre, tags, summary, media, publish, adult, thumbnail_big, link, thumbnail_small, B.like, C.star, is_cartoon from toondere_webtoon A, (select * from toondere_likewebtoon D where user_id = %s and D.like = true) B left join (select * from toondere_star where user_id = %s) C on B.webtoon_id = C.webtoon_id where A.id = B.webtoon_id""",(userId, userId))

    data = dictfetchall(cursor)

    pageNo = request.POST.get('pageNo',1)
    serialized = []
    paginator = Paginator(data,10)
    try:
        #pageNo에 해당하는 페이지호출
        page = paginator.page(pageNo)
    except InvalidPage:
        raise Http404('invaild page {}'.format(pageNo))

    for d in page.object_list:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# raw 쿼리 날리고 소수점을 json 으로 만들때
def decimal_default(obj):
    if isinstance(obj, decimal.Decimal):
        return float(obj)
    raise TypeError

# 메인페이지
def mainPage(request):


    cursor = connection.cursor()

    cursor.execute("""select * from toondere_webtoon A, ( select webtoon_id, count(*) as cnt, round(avg(star),0) as average from toondere_star group by webtoon_id ) B where A.id = B.webtoon_id order by average desc, cnt desc limit 10""")

    data = dictfetchall(cursor)


    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 검색 자동완성
def searchName(request):

    authorList = []
    title = models.Webtoon.objects.values_list('title', flat =True)
    author = models.Webtoon.objects.values_list('author', flat =True)

    for i in author:
        splitItem = i.split(',')

        for j in splitItem:
            authorList.append(j)

    authorSet = set(authorList)
    authorSet.remove('')

    dataSet = set(title) | authorSet
    dataSet = sorted(dataSet)



    result = []
    for j in range(len(dataSet)):
        d = {"searchName": dataSet[j]}
        result.append(d)
        # result.append(dict(('searchName', i) for i in dataSet))

    j = json.dumps(result, ensure_ascii=False)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 검색어가 들어오면 리스트 출력
def search(request):

    searchName = request.POST.get('searchName')

    cursor = connection.cursor()

    cursor.execute(""" select A.id, title, author, genre, tags, summary, media, publish, adult, thumbnail_big, link, thumbnail_small, is_cartoon, B.average*100 as average from toondere_webtoon A left outer join (select webtoon_id, round(avg(star),2) as average from toondere_webtoon A, toondere_star B where A.id = B.webtoon_id and webtoon_id in (select id from toondere_webtoon where title like '%{0}%' or author like '%{1}%') group by webtoon_id) B on A.id = B.webtoon_id where title like '%{2}%' or author like '%{3}%'""".format(searchName,searchName,searchName,searchName))

    data = dictfetchall(cursor)


    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 이메일 회원가입
def emailRegi(request):
    global userbyWebtoons
    if request.method == 'POST':

        primary = request.POST.get('primary')
        name = request.POST.get('name')
        password = request.POST.get('password')
        profile = request.POST.get('profile')
        message = request.POST.get('message')
        isRegi = models.User.objects.filter(primary = primary)

        if(isRegi):
            print("가입실패")
            return render(request, 'toondere/sameprimary.html',{})

        else:
            print("가입성공")
            p = models.User(primary=primary, name=name, profile=profile, password=password, message=message)
            p.save()
            # 가입 성공
            print(userbyWebtoons.shape[0])
            userbyWebtoons = Recommend.addUserRow(userbyWebtoons,1)
            print(userbyWebtoons.shape[0])
            return render(request, 'toondere/regisuccess.html',{})


    return render(request, 'toondere/post_insert.html',{})


# 이메일 로그인
def emailLogin(request):
    global userbyWebtoons
    if request.method == 'POST':


        primary = request.POST.get('primary')
        password = request.POST.get('password')
        User = models.User.objects.filter(primary = primary).filter(password = password)
        isRegi = models.User.objects.filter(primary = primary)


        if(User):
            print("로그인성공")
            # user = User[0].serialize()
            userId = User[0].id
            cursor = connection.cursor()
            cursor.execute("""select (select count(*) from toondere_star C, toondere_webtoon D where C.webtoon_id = D.id and user_id=%s and is_cartoon =TRUE) as cartooncount, (select count(*) from toondere_star C, toondere_webtoon D where C.webtoon_id = D.id and user_id=%s and is_cartoon =FALSE) as webtooncount, (select count(*) from toondere_likewebtoon A where user_id= %s and A.like =true) as likecount, (select count(*) from toondere_dontseewebtoon A where user_id= %s and A.dontsee = true) as dontseecount""", (userId, userId, userId, userId));
            serialized = []
            data = dictfetchall(cursor)

            for d in data:

                serialized.append(d)


            user = User[0].serialize()

            serialized.append(user)

            j = json.dumps(serialized, ensure_ascii=False)


        else:
            print("로그인 실패")
            #아이디 비밀번호 틀림
            return render(request, 'toondere/login_error.html',{})


    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 사용자 로그 기록
def userLog(request):
    if request.method == 'POST':


        userId = request.POST.get('userId')
        webtoonId = request.POST.get('webtoonId')
        time = request.POST.get('time')
        webtoonContent = models.Webtoon.objects.get(id=webtoonId)
        userContent = models.User.objects.get(id=userId)

        p = models.UserLog(webtoon=webtoonContent, time=time, user=userContent)

        p.save()


    return render(request, 'toondere/post_insert.html',{})

# 보기싫어요 true/false
def dontsee(request):
    webtoonId = request.POST.get('webtoonId')
    userId = request.POST.get('userId')

     #보기싫어요 눌렀는지 확인
    exist = models.DontseeWebtoon.objects.filter(user=userId).\
    filter(webtoon=webtoonId)

    if(exist):
        print("보기싫어요 중복 O")

        if(exist[0].dontsee == True):
            exist[0].dontsee = False
            exist[0].save()
        else:
            exist[0].dontsee = True
            exist[0].save()

    else:
        print("보기싫어요 중복 X")

        webtoonContent = models.Webtoon.objects.get(id=webtoonId)
        userContent = models.User.objects.get(id=userId)

        p = models.DontseeWebtoon(webtoon=webtoonContent, \
            user=userContent, dontsee = 1)
        p.save()
    return render(request, 'toondere/post_insert.html',{})

# 코멘트 작성
def wirte_comment(request):
    webtoonId = request.POST.get('webtoonId')
    userId = request.POST.get('userId')
    comment = request.POST.get('comment')


    webtoonContent = models.Webtoon.objects.get(id=webtoonId)
    userContent = models.User.objects.get(id=userId)


    p = models.Comment(webtoon=webtoonContent, \
            user=userContent, comment = comment)
    p.save()
    return render(request, 'toondere/post_insert.html',{})

#코멘트 받아옴
def get_comment(request):
    webtoonId = request.POST.get('webtoonId')

    cursor = connection.cursor()

    cursor.execute("""select name, profile, comment, A.id from toondere_user A, (select * from toondere_comment where webtoon_id = {0}) B where A.id = B.user_id""".format(webtoonId))

    data = dictfetchall(cursor)

    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 웹툰 평가갯수 랭킹순
def count_of_webtoon_rank(request):

    cursor = connection.cursor()

    cursor.execute("""select * from toondere_webtoon A, ( select webtoon_id, count(*) as cnt, round(avg(star),0)*100 as average from toondere_star group by webtoon_id ) B where A.id = B.webtoon_id and A.is_cartoon = false order by cnt desc, average desc limit 30""")

    data = dictfetchall(cursor)

    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 웹툰 평균평점 랭킹순
def score_of_webtoon_rank(request):

    cursor = connection.cursor()

    cursor.execute("""select * from toondere_webtoon A, ( select webtoon_id, count(*) as cnt, round(avg(star),0)*100 as average from toondere_star group by webtoon_id ) B where A.id = B.webtoon_id and A.is_cartoon = false order by average desc, cnt desc limit 30""")

    data = dictfetchall(cursor)

    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 만화 평가갯수 랭킹순
def count_of_cartoon_rank(request):

    cursor = connection.cursor()

    cursor.execute("""select * from toondere_webtoon A, ( select webtoon_id, count(*) as cnt, round(avg(star),0)*100 as average from toondere_star group by webtoon_id ) B where A.id = B.webtoon_id and A.is_cartoon = true order by cnt desc, average desc limit 30""")

    data = dictfetchall(cursor)

    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 만화 평균평점 랭킹순
def score_of_cartoon_rank(request):

    cursor = connection.cursor()

    cursor.execute("""select * from toondere_webtoon A, ( select webtoon_id, count(*) as cnt, round(avg(star),0)*100 as average from toondere_star group by webtoon_id ) B where A.id = B.webtoon_id and A.is_cartoon = true order by average desc, cnt desc limit 30""")

    data = dictfetchall(cursor)

    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 취향분석
def userTaste(request):

    userId = request.POST.get('userId')

    cursor = connection.cursor()

    cursor.execute("""select id, tags, genre, media, star from toondere_webtoon A, (select webtoon_id, star from toondere_star where user_id = {0}) B where A.id= B.webtoon_id""".format(userId))

    toonsInfo = dictfetchall(cursor)
    for info in toonsInfo:
        info['genre'] = set(info['genre'].split(','))
        info['genre'].remove('')
        if info['tags'] != None:
            info['tags'] = info['tags'].split(',')
            info['tags'].remove('')

    resultDict = UserTaste.userTaste(toonsInfo, userId)

    print(resultDict)

    serialized = []
    serialized.append(resultDict)

    j = json.dumps(serialized, ensure_ascii=False)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 작가이름 검색
def search_author_name(request):

    searchName = request.POST.get('searchName')
    cursor = connection.cursor()

    cursor.execute("""select A.id, A.title, A.author, A.genre, A.tags, A.summary, A.media, A.publish, A.adult, A.thumbnail_big, A.link, A.thumbnail_small, A.is_cartoon, round(avg(star),2)*100 as average from (select * from toondere_webtoon where author like '{0},%' union select * from toondere_webtoon where author like '%,{1},%') A left outer join toondere_star B on A.id = B.webtoon_id group by A.id, A.title, A.author, A.genre, A.tags, A.summary, A.media, A.publish, A.adult, A.thumbnail_big, A.link, A.thumbnail_small, A.is_cartoon""".format(searchName,searchName))

    data = dictfetchall(cursor)

    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 태그
def search_tag_name(request):

    searchName = request.POST.get('searchName')
    cursor = connection.cursor()

    cursor.execute("""select A.id, A.title, A.author, A.genre, A.tags, A.summary, A.media, A.publish, A.adult, A.thumbnail_big, A.link, A.thumbnail_small, A.is_cartoon, round(avg(star),2)*100 as average from (select * from toondere_webtoon where tags like '%{0}%') A left outer join toondere_star B on A.id = B.webtoon_id group by A.id, A.title, A.author, A.genre, A.tags, A.summary, A.media, A.publish, A.adult, A.thumbnail_big, A.link, A.thumbnail_small, A.is_cartoon""".format(searchName))

    data = dictfetchall(cursor)

    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 웹툰 좋아요 순 랭킹
def webtoon_like(request):

    cursor = connection.cursor()

    cursor.execute("""select * from toondere_webtoon A, ( select webtoon_id, count(*) as cnt, round(avg(star),0)*100 as average from toondere_star group by webtoon_id ) B, (select webtoon_id, count(*) as likecnt from toondere_likewebtoon A where A.like = true group by webtoon_id) C where A.id = B.webtoon_id and A.id = C.webtoon_id and A.is_cartoon = false order by likecnt desc, cnt desc limit 30""")

    data = dictfetchall(cursor)

    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 만화 좋아요 순 랭킹
def cartoon_like(request):

    cursor = connection.cursor()

    cursor.execute("""select * from toondere_webtoon A, ( select webtoon_id, count(*) as cnt, round(avg(star),0)*100 as average from toondere_star group by webtoon_id ) B, (select webtoon_id, count(*) as likecnt from toondere_likewebtoon A where A.like = true group by webtoon_id) C where A.id = B.webtoon_id and A.id = C.webtoon_id and A.is_cartoon = true order by likecnt desc, cnt desc limit 30""")

    data = dictfetchall(cursor)

    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 웹툰 로그 순 랭킹
def webtoon_log(request):

    cursor = connection.cursor()

    cursor.execute("""select * from toondere_webtoon A, ( select webtoon_id, count(*) as cnt, round(avg(star),0)*100 as average from toondere_star group by webtoon_id ) B, (select webtoon_id, count(*) as logcnt from toondere_userlog group by webtoon_id) C where A.id = B.webtoon_id and A.id = C.webtoon_id and A.is_cartoon = false order by logcnt desc, cnt desc limit 30""")

    data = dictfetchall(cursor)

    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)

    return HttpResponse(j, content_type='application/json; charset=utf-8')

# 웹툰 로그 순 랭킹
def cartoon_log(request):

    cursor = connection.cursor()

    cursor.execute("""select * from toondere_webtoon A, ( select webtoon_id, count(*) as cnt, round(avg(star),0)*100 as average from toondere_star group by webtoon_id ) B, (select webtoon_id, count(*) as logcnt from toondere_userlog group by webtoon_id) C where A.id = B.webtoon_id and A.id = C.webtoon_id and A.is_cartoon = true order by logcnt desc, cnt desc limit 30""")

    data = dictfetchall(cursor)

    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)

    return HttpResponse(j, content_type='application/json; charset=utf-8')