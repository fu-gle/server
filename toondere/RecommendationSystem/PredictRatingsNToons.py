import numpy as np
from operator import itemgetter
import copy

underPoint = 100000
unSeen = 1

def doRecommend(genres, toonsNPred, userNo, userMean):
    # 별점이 높은 순으로 정렬
    toonsNPred = sorted(toonsNPred.items(), key=itemgetter(1), reverse=True)
    toonsList = []
    if userMean > 4.2:
        userMen  = 4.2

    for i in toonsNPred:
        if i[1] == -1000000:
            print(" TODO : 들어오나 확인합시다 - 만화를 너무 많이 본 경우")
            toonsList.append([i[0] + 1, i[1]])
        elif i[1] == -2000000:
            print(" TODO : 들어오나 확인합시다 - 만화를 본 사용자가 없는 경우")
            prediction = whenRatedbyNone(genres, ucRatings, userNo, i[0])

        if i[1] > (userMean * underPoint):
            toonsList.append([i[0] + 1, i[1]])

    return toonsList

def predictRatings(ucRatings, simsUsers, candi, userNo):
    c = {}  # 만화의 예상 별점을 저장할 사전
    if candi == set():  # 추천해줄 만화가 없다면 - 만화를 많이 본 경우
        print("아무도 보지 않은 이런 만화는 어떠세요? 빨리 데이터를 넘기라구!")
        for toon in range(len(ucRatings)):
            if np.count_nonzero(ucRatings) < unSeen:
                candi.add(toon)
            if len(candi) > 10:
                break

    for toonNo in candi:  # 사용자별 추천 목록의 만화에 대해서
        prediction = predictRatingsfor1Toon(
                                ucRatings, simsUsers, userNo + 1, toonNo + 1)

        # 만화에 해당화는 예상 별점 값 저장
        c[toonNo] = prediction

    mean = getUserMean(ucRatings, userNo)

    return c, mean

def predictRatingsfor1Toon(ucRatings, simsUsers, userNo, toonNo):
    userNo = int(userNo) - 1
    toonNo = int(toonNo) - 1

    # if toonNo > ucRatings.shape[1]:
    #     return

    ind = (ucRatings[:, toonNo] > 0)

    normal = sum(np.absolute(simsUsers[userNo, ind]))

    s1 = copy.deepcopy(simsUsers[userNo, ind])
    s2 = copy.deepcopy(ucRatings[ind, toonNo])
    for i in range(len(s1)):
        if s1[i] < 0:
            s2[i] = 58 - s2[i]
            s1[i] *= -1
        if s2[i] > 50:
            s2[i] = 50

    prediction = np.dot(s1, s2) / normal
    del(s1)
    del(s2)

    if normal == 0.0:
        rating = sum(ucRatings[ind, toonNo])
        indTrue = [x for x in ind if True]
        if rating != 0.0:
            rating = rating / len(indTrue)
            prediction = (getUserMean(ucRatings, userNo) + rating) / 2
        elif np.count_nonzero(ucRatings[:, toonNo]) < unSeen:
            prediction = -1.0
        else: # 그냥 rating = 0.0 일때 - 사용자의 장르 평균으로 계산
            prediction = -2.0

    return int(prediction * underPoint)

def getUserMean(ucRatings, user):
    ind = (ucRatings[user, :] > 0)
    if len(ucRatings[user, ind]) == 0:  # 사용자가 평가를 하지 않았다면
        return 0
    return sum(ucRatings[user, ind]) / len(ucRatings[user, ind])

def whenRatedbyNone(genres, ucRatings, userNo, toonNo):
    inGenre = []
    for genre, toons in genres.items():
        if toonNo in toons:
            inGenre.append(genre)

    ratedToons = set(np.nonzero(ucRatings[userNo])[0][:])
    genreMean = []
    for genre in inGenre:
        sumG = 0
        toGrading = genres[genre] & ratedToons
        if toGrading == set():
            continue
        for elt in toGrading:
            sumG += ucRatings[userNo][elt]
        sumG = sumG / len(toGrading)
        genreMean.append(sumG)

    prediction = 3.0
    if len(genreMean) > 1:
        prediction = sum(genreMean) / len(genreMean)
    elif genreMean == []:
        prediction = getUserMean(ucRatings, userNo) - 5.0
    return int(prediction * underPoint)