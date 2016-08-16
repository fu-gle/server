from toondere.RecommendationSystem import GradingNSimilarities as GnS
from toondere.RecommendationSystem import PickSimilarUsers as PSU
from toondere.RecommendationSystem import ToonsfromSimilars as TfS
from toondere.RecommendationSystem import ToonsfromGenre as TfG
from toondere.RecommendationSystem import ToonsfromAuthors as TfA
from toondere.RecommendationSystem import PredictRatings as PR
from toondere.RecommendationSystem import RecommendToons as RT
from toondere.RecommendationSystem import SvdMatrix as SM

import numpy as np
import time


"""
# TODO : makeGenreGnS 함수를 한번만 계산해서 두 함수가 쓸 수 있으려면.. 
# 사실 recommendfromSimilars 에서는 uGradesGenre가 필요가 없네;
# 그리고 유사도 기반으로 예측별점 구하는 데는 똑같고!
# 그런 정리가 필요함!
"""
# 장르 여러 개의 만화를 한 번에
def recommendfromGenre(genres, ucRatings, userNo):
    '''
    # 유사한 사용자를 계산해서 만화 목록을 추천 받음.
    '''
    userNo = int(userNo)
    userNo -= 1
    if (userNo >= len(ucRatings)) or (userNo < 0):
        assert False

    # 사용자의 장르 평가, 사용자간 유사도가 반환됨.
    uGradesGenre, simsUsers = makeGenreGnS(genres, ucRatings)

    recommendCandidate = TfG.toonsfromGenrefor1User(
                        genres, ucRatings[userNo], 
                        uGradesGenre[userNo], userNo)

    # TODO : 여기서도 사용자간 유사도를 통해 예측 별점을 계산하게 했음. 
    # 흐으으음... 아 빨리 데이터가 나와야 알고리즘이 까이든지 말든지 할텐데ㅜㅠㅜㅠ
    toonsNPred = PR.predictRatingsfor1User(
                        ucRatings, simsUsers, recommendCandidate, userNo)

    print(RT.doRecommendfor1User(toonsNPred, userNo))
    # 추천할 만화 목록을 list로 반환
    return RT.doRecommendfor1User(toonsNPred, userNo)

# 장르 하나당의 추천
def recommendfrom1Genre(genres, ucRatings, genreNo, userNo):
    '''
    # 유사한 사용자를 계산해서 만화 목록을 추천 받음.
    '''
    uesrNo = int(userNo)
    userNo -= 1
    if (userNo >= len(ucRatings)) or (userNo < 0):
        assert False

    # 사용자의 장르 평가, 사용자간 유사도가 반환됨.
    uGradesGenre, simsUsers = makeGenreGnS(genres, ucRatings)

    recommendCandidate = TfG.toonsfrom1Genrefor1User(
                            genres, ucRatings[userNo], 
                            genreNo, userNo)

    # TODO : 여기서도 사용자간 유사도를 통해 예측 별점을 계산하게 했음. 
    # 흐으으음... 아 빨리 데이터가 나와야 알고리즘이 까이든지 말든지 할텐데ㅜㅠㅜㅠ
    toonsNPred = PR.predictRatingsfor1User(
                        ucRatings, simsUsers, recommendCandidate, userNo)

    print(RT.doRecommendfor1User(toonsNPred, userNo))
    # 추천할 만화 목록을 list로 반환
    return RT.doRecommendfor1User(toonsNPred, userNo)

def recommendfromSimilars(genres, ucRatings, userNo):
    '''
    
    # 유사한 사용자를 계산해서 만화 목록을 추천 받음.
    '''
    userNo = int(userNo)
    userNo -= 1
    if (userNo >= len(ucRatings)) or (userNo < 0):
        assert False
    

    # 사용자의 장르 평가, 사용자간 유사도가 반환됨.
    uGradesGenre, simsUsers = makeGenreGnS(genres, ucRatings)
    

    simUserIndices = PSU.bestSimilarUsersfor1User(simsUsers, userNo)
    

    recommendCandidate = TfS.toonsfromSimilarsfor1User(
                                    ucRatings, simUserIndices, userNo)
    # print(recommendCandidate)

    toonsNPred = PR.predictRatingsfor1User(
                    ucRatings, simsUsers, recommendCandidate, userNo)

    # 추천할 만화 목록을 list로 반환
    return RT.doRecommendfor1User(toonsNPred, userNo)

# 장르 구별 없이!
def makeGenreGnS(genres, ucRatings):
    # @전체@ 사용자들의 장르 평가 점수 계산 - 유사도 계산을 위해서 전체가 필요해..
    uGradesGenre = GnS.gradingGroupsforAll(genres, ucRatings)

    if len(ucRatings) < 7:
        # svd를 거친 행렬
        svdUGG = SM.npSvds(uGradesGenre)
        # @전체@ 사용자에 대해서 사용자들의 장르 평가로 유사도 계산 - svd 행렬으로
        simsUsers = GnS.calculateSimsforAll(svdUGG)
    else:
        # @전체@ 사용자에 대해서 사용자들의 장르 평가로 유사도 계산 - svd 행렬으로
        simsUsers = GnS.calculateSimsforAll(uGradesGenre)

    return uGradesGenre, simsUsers


if __name__ == "__main__":
    recommendfromSimilars(genres, ucRatings, userNo)
    # recommendfromGenre(genres, ucRatings, userNo)
    # recommendfrom1Genre(genres, ucRatings, genreNo, userNo)