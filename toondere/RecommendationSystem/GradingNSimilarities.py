import numpy as np
import scipy.stats
import scipy.sparse
import math
import time

underPoint = 1000000

def gradingGroupsforAll(genres, ucRatings):
    '''
    # genres : {"장르 번호":[만화리스트], ...}
    # ucRatings : ((사용자 수, 만화 수))  = 별점 행렬
    '''
    numofUser = len(ucRatings)  # 전체 사용자 수

    # ((사용자 수, 그룹 수)) 장르 평가를 저장할 행렬
    uGradesGenre = np.zeros((numofUser, len(genres)))

    for userNo in range(numofUser):  # 각 사용자에 대해
        g = gradingGroups(genres, ucRatings, userNo)
        uGradesGenre[userNo] = g

    return uGradesGenre  # 장르 평가 행렬 반환

def gradingGroups(genres, ucRatings, userNo):
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
        if len(toGrading) > 0:
            gradesGenre[genre] = \
                    int(sumGrade / len(toGrading) * underPoint)
        else:
            gradesGenre[genre] = 0
    return gradesGenre

def calculateSimsforAll(uGradesGenre, genderNage=[]):
    '''
    # uGradesGenre : (사용자 수 , 장르 수) = 점수
    '''
    # 사용자가 7명 이상이라면 차원 축소
    if len(uGradesGenre) > 7:
        uGradesGenre = npSvds(uGradesGenre)

    numofUser = len(uGradesGenre)  # 전체 사용자 수
    simsUsers = np.zeros((numofUser,numofUser))  # ((사용자, 사용자)) = 유사도 행렬

    for user1 in range(numofUser):  # 한 사용자에 대해
        for user2 in range(user1):  # 나머지 사용자들과의 유사도를 계산
            simsUsers[user1][user2] = calculateSims(
                                        uGradesGenre[user1],
                                        uGradesGenre[user2])
            '''
            # 성별, 나이가 들어갔을 때
            if genderNage[user1] == genderNage[user2]:
                simsUsers[user1][user2] *= 1.05
            else:
                simsUsers[user1][user2] *= 0.95
            '''

    # 행렬의 low-triangle을 상단에 복사함
    for user1 in range(numofUser - 1):
        for user2 in range(user1 + 1, numofUser):
            simsUsers[user1][user2] = simsUsers[user2][user1]

    return simsUsers

def similaritiesItem(ucRatings):
    numofToon = ucRatings.shape[1]
    simsToons = np.zeros((numofToon, numofToon))

    if ucRatings.shape[0] > 7:
        ucRatings = npSvds(ucRatings.T).T

    for c1 in range(numofToon):
        for c2 in range(c1):
            simsToons[c1][c2] = \
                calculateSims(ucRatings[:, c1], ucRatings[:, c2])
    # 행렬의 low-triangle을 상단에 복사함
    for c1 in range(numofToon - 1):
        for c2 in range(c1 + 1, numofToon):
            simsToons[c1][c2] = simsToons[c2][c1]

    return simsToons


def calculateSims(uGGforUser1, uGGforUser2):
    '''
    uGGforUser1, uGGforUser2 : 사용자 1, 2의 (1, 장르 수) = 점수
    '''
    sim = scipy.stats.pearsonr(uGGforUser1, uGGforUser2)[0]
    if not math.isnan(sim):
        sim = int(sim * underPoint)
    else:  # 계산 결과가 Nan이면
        sim = 0

    return sim


def npSvds(data):
    U, sigma, VT = np.linalg.svd(data)

    sigma2 = sigma ** 2
    totalMatrix = np.sum(sigma2)

    numSingular = 0
    for i in range(len(sigma)):
        if sum(sigma2[:i]) > totalMatrix * 0.9:
            numSingular = i

    sigma3 = np.eye(numSingular) * sigma[:numSingular]

    return np.asarray(np.dot(U[:, :numSingular], sigma3))