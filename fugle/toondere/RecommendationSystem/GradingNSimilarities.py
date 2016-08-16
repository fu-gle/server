import math
import numpy as np
import copy
import time
import scipy.stats

underPoint = 100000

def gradingGroupsforAll(genres, ucRatings):
    '''
    # genres : {"장르 번호":[만화리스트], ...}
    # ucRatings : ((사용자 수, 만화 수))  = 별점 행렬
    '''
    numofUser = len(ucRatings)  # 전체 사용자 수

    # ((사용자 수, 그룹 수)) 장르 평가를 저장할 행렬
    uGradesGenre = np.zeros((numofUser, len(genres))) 

    for userNo in range(numofUser):  # 각 사용자에 대해
        g = gradingGroupsfor1User(genres, ucRatings, userNo)
        uGradesGenre[userNo] = g

    return uGradesGenre  # 장르 평가 행렬 반환


# 사용자 한 명에 대해서 - 모듈 밖에서 쓸 수 있게 만든 것.
def gradingGroupsfor1User(genres, ucRatings, userNo):
    '''
    # genres : {"장르 번호":[만화리스트], ...}
    # ucRatings : ((사용자 수, 만화 수))  = 별점 행렬
    # userNo = 사용자 번호
    '''
    ratedToons = set(np.nonzero(ucRatings[userNo])[0][:])  # 사용자가 평가한 만화 목록
    gradesGenre = np.zeros(len(genres))

    for genre, toonsSet in genres.items():
        sumGrade = 0  # 장르 점수
        toGrading = toonsSet & ratedToons

        for elt in toGrading:
            sumGrade += ucRatings[userNo][elt]  # 장르 점수 계산

        # 장르에 속한 전체 만화 수로 나눔
        gradesGenre[genre] = \
            int(sumGrade / len(toonsSet) * underPoint)
    return gradesGenre

def calculateSimsforAll(uGradesGenre):
    '''
    # uGradesGenre : (사용자 수 , 장르 수) = 점수
    '''
    numofUser = len(uGradesGenre)  # 전체 사용자 수
    simsUsers = np.zeros((numofUser,numofUser))  # ((사용자, 사용자)) = 유사도 행렬 

    for user1 in range(numofUser):  # 한 사용자에 대해
        for user2 in range(user1):  # 나머지 사용자들과의 유사도를 계산
            simsUsers[user1][user2] = calculateSimsfor1User(
                                        uGradesGenre[user1], 
                                        uGradesGenre[user2])
    # 행렬의 low-triangle을 상단에 복사함
    for user1 in range(numofUser-1):
        for user2 in range(user1 + 1, numofUser):
            simsUsers[user1][user2] = simsUsers[user2][user1]

    return simsUsers

def calculateSimsfor1User(uGGforUser1, uGGforUser2):
    '''
    uGGforUser1, uGGforUser2 : 사용자 1, 2의 (1, 장르 수) = 점수
    '''
    sim = scipy.stats.pearsonr(uGGforUser1, uGGforUser2)[0]
    if not math.isnan(sim):
        sim = int(sim * underPoint)
        if sim < 0:
            sim = 0
    else:  # 계산 결과가 Nan이면 
        sim = 0

    return sim
