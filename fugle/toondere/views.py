from django.shortcuts import render
from django.http import HttpResponse
import json, decimal
from toondere import models
from numpy import zeros
from django.core.paginator import InvalidPage, Paginator
from toondere.RecommendationSystem import Recommend
from django.http import Http404
from django.db import connection
from collections import namedtuple

# raw 쿼리 날린 결과를 사전 형식으로 바꿔주는 함수
def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

def post_list(request):

    media = request.POST.get('media')
    userId = request.POST.get('userId')
    starData = models.Star.objects.filter(user_id=userId)

    cursor = connection.cursor()

    if(media == None):
        print("필터적용 x")
        cursor.execute("""select * from toondere_webtoon A left join 
toondere_likewebtoon C 
on A.id = C.webtoon_id 
and user_id = %s 
where not exists (select * from toondere_star B where user_id = %s and A.id = B.webtoon_id order by random())""", (userId, userId))
        #random = models.Webtoon.objects.all().order_by('?')

    else:
        print("필터적용 o")
        cursor.execute("""select * from toondere_webtoon A left join 
toondere_likewebtoon C 
on A.id = C.webtoon_id 
and user_id = %s
where not exists (select * from toondere_star B where user_id = %s and A.id = B.webtoon_id) and A.media = %s order by random()""", (userId, userId, media))


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

#@csrf_exempt
def post_insert(request):
    if request.method == 'POST':

        webtoon = request.POST.get('webtoonId')
        star = request.POST.get('star')
        user = request.POST.get('userId')
        #별점을 메겼는지 확인
        exist = models.Star.objects.filter(user=user).\
        filter(webtoon=webtoon)
        
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
            webtoonContent = models.Webtoon.objects.get(id=webtoon)
            userContent = models.User.objects.get(id=user)
            print("------------------->"+str(webtoon) + str(star) + str(user))
            p = models.Star(webtoon=webtoonContent, star=star, user=userContent)

            p.save()
            



    return render(request, 'toondere/post_insert.html',{})


def webtoon_list(request):

    genreSet = set([])
    
    genre1 = models.Webtoon.objects.values_list('genre1', flat =True)
    genre2 = models.Webtoon.objects.values_list('genre2', flat =True)
    genre3 = models.Webtoon.objects.values_list('genre3', flat =True)
    allData = models.Webtoon.objects.all()
    starData = models.Star.objects.all()
    numofUsers = models.User.objects.count()
    numofWebtoons = models.Webtoon.objects.count()
    numofStars = models.Star.objects.count()


    userbyWebtoons = zeros((numofUsers, numofWebtoons))
    
    for i in range(numofStars):
        userbyWebtoons[starData[i].user.id-1][starData[i].webtoon.id-1] = \
            starData[i].star

    s = set([])
    s.add(None)
    genreSet = (set(genre1) | set(genre2) | set(genre3)) - s

    genreSet = sorted(genreSet)
    # print(genreSet)
    genreDict = {}

    index = 0
    for g in genreSet:
        genreDict[g] = index
        index += 1

    # genre = []
    # for i in range(index):
    #     genre.append([])

    # for i in genre1:
    #     genreSet.add(i)
    # for i in genre2:
    #     genreSet.add(i)
    # for i in genre3:
    #     genreSet.add(i)

    # for i in range(len(genreSet)):
    #     genre[genreSet[i]] = 

    # for i in data1:
    #     if(i in genre):
    #         genre[i].append(i)
    #appendCartoon(genre)
    # print(type(allData[0]))
    # print(allData[0].genre1)
    resultDict = {}
    for i in range(index):
        resultDict[i] = []


    for webtoon in allData:
        if webtoon.genre1 != None:
            resultDict[genreDict[webtoon.genre1]].append(webtoon.id - 1)
        if webtoon.genre2 != None:
            resultDict[genreDict[webtoon.genre2]].append(webtoon.id - 1)
        if webtoon.genre3 != None:
            resultDict[genreDict[webtoon.genre3]].append(webtoon.id - 1)

    # for webtoon in allData:
    #     if webtoon.genre1 != None:
    #         genre[genreDict[webtoon.genre1]].append(webtoon.id)
    #     if webtoon.genre2 != None:
    #         genre[genreDict[webtoon.genre2]].append(webtoon.id)
    #     if webtoon.genre3 != None:
    #         genre[genreDict[webtoon.genre3]].append(webtoon.id)

    f = open("test", "wt", encoding="utf-8")
    f.write(str(resultDict))
    f.close()


    # main(userbyWebtoons, resultDict)


    return HttpResponse(resultDict)


def userLogin(request):
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

        user = User[0].serialize()
        j = json.dumps(user, ensure_ascii=False)


    return HttpResponse(j, content_type='application/json; charset=utf-8')

def mystar(request):
    userId = request.POST.get('userId')
    data = models.Webtoon.objects.filter(star__user_id=userId).\
    values("id","title","author1","author2","genre1","genre2","genre3",\
        "summary","media","publish","age","thumbnail_small","thumbnail_big","link","star__star")
    
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


    # serialized = []
    # for d in data:
    #     serialized.append(d)
    # j = json.dumps(serialized, ensure_ascii=False)
#return render(request, 'blog/post_list.html', {})
    return HttpResponse(j, content_type='application/json; charset=utf-8')


def detail(request):
    webtoonId = request.POST.get('webtoonId')
    data = models.Webtoon.objects.get(id=webtoonId)
    print(data)
    serialized = []
    serialized.append(data.serialize())
    j = json.dumps(serialized, ensure_ascii=False)
#return render(request, 'blog/post_list.html', {})
    return HttpResponse(j, content_type='application/json; charset=utf-8')


def recommend(request):

    genreSet = set([])
    userId = request.POST.get('userId')
    genre1 = models.Webtoon.objects.values_list('genre1', flat =True)
    genre2 = models.Webtoon.objects.values_list('genre2', flat =True)
    genre3 = models.Webtoon.objects.values_list('genre3', flat =True)
    allData = models.Webtoon.objects.all()
    starData = models.Star.objects.all()
    numofUsers = models.User.objects.count()
    numofWebtoons = models.Webtoon.objects.count()
    numofStars = models.Star.objects.count()
    pageNo = request.POST.get('pageNo',1)
    



    userbyWebtoons = zeros((numofUsers, numofWebtoons))

    for i in range(numofStars):
        userbyWebtoons[starData[i].user.id - 1]\
                      [starData[i].webtoon.id - 1] = \
            starData[i].star


    s = set([])
    s.add(None)
    genreSet = (set(genre1) | set(genre2) | set(genre3)) - s

    genreSet = sorted(genreSet)
    # print(genreSet)
    genreDict = {}

    index = 0
    for g in genreSet:
        genreDict[g] = index
        index += 1



    resultDict = {}
    for i in range(index):
        resultDict[i] = set()


    for webtoon in allData:
        
        if webtoon.genre1 != None:
            resultDict[genreDict[webtoon.genre1]].add(webtoon.id - 1)
        if webtoon.genre2 != None:
            resultDict[genreDict[webtoon.genre2]].add(webtoon.id - 1)
        if webtoon.genre3 != None:
            resultDict[genreDict[webtoon.genre3]].add(webtoon.id - 1)

    f = open("test", "wt", encoding="utf-8")
    f.write(str(resultDict))
    f.close()

    fromSimilars = Recommend.recommendfromSimilars(
                                resultDict, userbyWebtoons, userId)
    # fromGenres = Recommend.recommendfromGenre(
                                    # resultDict, userbyWebtoons, 1)

    
    serialized = []
    for i in range(len(fromSimilars)):
        data = models.Webtoon.objects.get(id=fromSimilars[i][0])

        serialized.append(data.serialize(fromSimilars[i][1]))
    j = json.dumps(serialized, ensure_ascii=False)


    return HttpResponse(j, content_type='application/json; charset=utf-8')

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

def decimal_default(obj):
    if isinstance(obj, decimal.Decimal):
        return float(obj)
    raise TypeError

def mainPage(request):

    cursor = connection.cursor()

    cursor.execute("""select * from toondere_webtoon A, ( select webtoon_id, count(*) as cnt, round(avg(star),0) as staravg from toondere_star group by webtoon_id )
 B where A.id = B.webtoon_id order by cnt desc, staravg desc limit 10""")

    data = dictfetchall(cursor)


    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)
    

    return HttpResponse(j, content_type='application/json; charset=utf-8')


def rankingAuthor(request):

    cursor = connection.cursor()

    cursor.execute(""" select author1, author2, count(*), round(avg(B.staravg),0) as avg from toondere_webtoon A, (select webtoon_id, count(*) as cnt, round(avg(star),0) as staravg 
from toondere_star group by webtoon_id) B 
where A.id = B.webtoon_id group by author1,  author2 order by count(*) desc, avg desc limit 10""")

    data = dictfetchall(cursor)


    serialized = []


    for d in data:

        serialized.append(d)

    j = json.dumps(serialized, ensure_ascii=False, default=decimal_default)
    

    return HttpResponse(j, content_type='application/json; charset=utf-8')

