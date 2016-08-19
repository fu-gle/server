import numpy as np
import math
import copy

def bestSimilarUsers(simsUsers, userNo):
    '''
    # simsUsers : ((사용자 1, 사용자 수)) = 유사도
    '''
    simsUser = simsUsers[userNo].tolist()
    simUserIndices = maxSimilarIndex(
                        simsUser, numofSimilars(2, len(simsUsers)))
    del simsUser
    return simUserIndices

def maxSimilarIndex(valueList, N):
    '''
    # valueList : [유사도, ...]
    # N : 뽑을 유사한 사용자의 수
    '''
    tempList = copy.deepcopy(valueList)  # 리스트 전체를 깊은 복사해오는 임시 리스트
    indices = []  # [valueList에서 순서대로 큰 값의 위치] (내림차순)
    for i in range(N):
        maxSim = max(tempList)
        if maxSim < 200000:
            indices.append(-1)  #여기서는 유사한 사용자 없음 처리만 함.
            return indices

        maxIndex = valueList.index(maxSim)
        tempList[maxIndex] = 0  # 다음 최고값을 찾을 수 있도록
        indices.append(maxIndex)

    del tempList
    return indices  # 최고 유사한 사용자들의 인덱스들 반환

def numofSimilars(code, numofUser):
    '''
    # code : 유사한 사용자 수를 계산하는 방법
    # 유사한 사용자의 수를 조절해보는 함수 (임시 - 모드 구현 기간)
    # 이후 전체 사용자 수에 따라 변동하는 함수로 수정 가능.
    '''
    if code == 1:
        return int(math.log(numofUser))
    elif code == 2:
        return int(math.log(numofUser)) + 1
    elif code == 3:
        return int(numofUser / 10)

def toonsfromSimilars(ucRatings, simUserIndices, userNo):
    '''
    # ucRatings : ((사용자 하나, 만화 수)) = 별점 행렬
    # simUserIndices : 한 사용자와 유사한 사용자들의 번호
    # userNo : 사용자 번호
    '''
    recommendCandidate = set()
    # userNo 사용자가 본 만화
    ratedbyTarget = set(np.nonzero(ucRatings[userNo])[0][:])

    if len(simUserIndices) == 1:
        print("유사한 사용자가 없어요..")
        return recommendCandidate

    for simUser in simUserIndices:  # 사용자와 유사한 한 명의 사용자에 대해
        # 유사한 사용자가 본 만화들의 집합
        ratedbySimilar = set(np.nonzero(
                                ucRatings[simUser])[0][:])
        # 사용자가 보지 않은 만화만 걸러내기
        recommendCandidate |= ratedbySimilar - ratedbyTarget

    return recommendCandidate