from toondere.RecommendationSystem import GradingNSimilarities as GNS
from toondere.RecommendationSystem import ToonsfromSimilars as TfS
from toondere.RecommendationSystem import ToonsfromGenre as TfG
from toondere.RecommendationSystem import FPTree as FP
from toondere.RecommendationSystem import ToonsfromLike as TfL
from toondere.RecommendationSystem import PredictRatingsNToons as PRNT
# from toondere.RecommendationSystem import CrossValidation as CV

import random as rd
import numpy as np
import math

# 사용자 가입시 행렬 추가
def addUserRow(ucRatings, numofAddedUser):
    numofToons = ucRatings.shape[1]
    newRow = np.array([0] * numofToons)

    for _ in range(numofAddedUser):
        ucRatings = np.vstack((ucRatings, newRow))

    return ucRatings

def recommendfromLike(likeList, userNo, support):
    '''
    likelist = [[toons..],[toons..], ...]
    '''
    initSet = FP.createInitSet(likeList)
    FPtree, Header = FP.createTree(initSet, support)
    freqItemList = []
    FP.mineTree(FPtree, Header,support, set([]), freqItemList)
    freqLike = FP.tidyFreqList(freqItemList)
    del freqItemList
    recommends = TfL.treeLike(freqLike, likeList, userNo)
    return recommends

def predictRatingToon(genres, ucRatings, userNo, toonNo):
    uGradesGenre = GNS.gradingGroupsforAll(genres, ucRatings)
    simsUsers = GNS.calculateSimsforAll(uGradesGenre)

    prediction = PRNT.predictRatingsfor1Toon(
                            ucRatings, simsUsers, userNo, toonNo)
    return prediction

def recommendfromGenre(genres, ucRatings, userNo):
    '''
    # 유사한 사용자를 계산해서 만화 목록을 추천 받음.
    '''
    userNo = int(userNo) - 1
    assert userNo < len(ucRatings) or userNo > 0

    uGradesGenre = GNS.gradingGroupsforAll(genres, ucRatings)
    simsUsers = GNS.calculateSimsforAll(uGradesGenre)

    bestGenresforUser = TfG.pickBestGenre(genres, uGradesGenre, userNo)

    if -1 in bestGenresforUser:  # 좋은 점수의 장르가 없을 때
        bestGenresforUser.remove(-1)
        numofGenre = len(genres)
        for _ in range(math.log(numofGenre) - len(bestGenresforUser)):
            bestGenresforUser.append(rd.randrange(numofGenre))

    eachGenre = {}
    for genreNo in bestGenresforUser:
        if genreNo == -1:
            continue
        recommends = TfG.toonsfrom1Genre(
                                genres, ucRatings,
                                genreNo, userNo)
        toonsNPred, userMean = PRNT.predictRatings(
                        ucRatings, simsUsers, recommends, userNo)
        eachGenre[genreNo] = PRNT.doRecommend(genres,
                                        toonsNPred, userNo, userMean)

    # 추천할 만화 목록을 사전으로 반환
    print(eachGenre)
    return eachGenre

def recommendfromSimilars(genres, ucRatings, userNo):
    '''
    # 유사한 사용자를 계산해서 만화 목록을 추천 받음.
    '''
    userNo = int(userNo) - 1
    assert userNo < len(ucRatings) or userNo > 0

    if np.count_nonzero(ucRatings[userNo]) == 0:
        return []

    uGradesGenre = GNS.gradingGroupsforAll(genres, ucRatings)
    simsUsers = GNS.calculateSimsforAll(uGradesGenre)
    # print(uGradesGenre)
    print("                         ")
    # print(simsUsers)

    simUserIndices = TfS.bestSimilarUsers(simsUsers, userNo)

    # 유사한 사용자 없음에 대한 처리
    noSimUser = [x for x in simUserIndices if x == -1]
    if noSimUser != []:
        simUserIndices.remove(-1)
        for user in range(len(ucRatings)):
            if np.count_nonzero(ucRatings[user]) > 10:
                simUserIndices.append(user)
            if len(simUserIndices) > math.log(len(ucRatings)) + 1:
                break

    recommendCandidate = TfS.toonsfromSimilars(
                                    ucRatings, simUserIndices, userNo)

    toonsNPred, userMean = PRNT.predictRatings(
                    ucRatings, simsUsers, recommendCandidate, userNo)

    # 추천할 만화 목록을 list로 반환
    recommends = PRNT.doRecommend(genres, toonsNPred, userNo, userMean)

    # CV.crossValidation(genres, ucRatings, simsUsers)

    return recommends