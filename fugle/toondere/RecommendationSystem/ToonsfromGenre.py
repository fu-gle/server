import numpy as np
import copy
import math

recommendGenre = 3

def toonsfromGenrefor1User(genres, ucRatingsfor1User, 
                           uGradesGenrefor1User, userNo):
    bestGenres = pickBestGenre(uGradesGenrefor1User, userNo)
    recommendSets = set()
    for genre in bestGenres:
        # TODO : 여기서 평점이 안 좋은 것은 걸러내서 좀 수를 줄이고 싶은데..
        recommendSets |= genres[genre] - set(ucRatingsfor1User)

    return recommendSets

def pickBestGenre(uGradesGenrefor1User, userNo):
    '''
    # uGradesGenrefor1User : userNo 사용자의 장르별 점수
    # ucRatingsfor1User : userNo 사용자가 별점을 매긴 만화
    # userNo : 사용자 번호
    '''
    grading = uGradesGenrefor1User.tolist()
    genreIndices = maxValueIndex(grading, recommendGenre)
    return genreIndices

def maxValueIndex(valueList, N):
    '''
    # valueList : [유사도, ...]
    # N : 뽑을 유사한 사용자의 수
    '''
    tempList = copy.deepcopy(valueList)  # 리스트 전체를 깊은 복사해오는 임시 리스트
    indices = []  # [valueList에서 순서대로 큰 값의 위치] (내림차순) 
    for i in range(N):
        maxSim = max(tempList)
        if maxSim == 0:  # 유사한 사용자가 없다면 TODO : 다른 방식의 추천
            indices.append(-1)
            return indices

        maxIndex = valueList.index(maxSim)
        tempList.remove(maxSim)  # 다음 최고값을 찾을 수 있도록 임시 리스트에서 제거
        indices.append(maxIndex)

    return indices  # 최고 유사한 사용자들의 인덱스들 반환

def numofSimilars(code, numofGenre):
    '''
    # code : 유사한 사용자 수를 계산하는 방법
    # 유사한 사용자의 수를 조절해보는 함수 (임시 - 모드 구현 기간)
    # 이후 전체 사용자 수에 따라 변동하는 함수로 수정 가능.
    '''
    if code == 1:
        return int(math.log(numofGenre))
    elif code == 2:
        return int(math.log(numofGenre)) + 1
    elif code == 3:
        return int(numofGenre / 10)