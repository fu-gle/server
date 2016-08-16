"""
import numpy as np
import math
import copy

# TODO : 모든 if문 try-except로 고치기?
# TODO : 아름다운 파이썬 코드란 어떻게??

def toonsfromSimilarAuthorsfor1User(authors, ucRatingsfor1User, 
                           uGradesAuthorsfor1User):
    # TODO : while문으로 set이 있을 때까지 돌리고 싶은데..ㅜㅠ python 코딩에 대해서 공부를 잘 해봐야 겠어..!
    # 어떻게 짜는게 더 아름답게 짜는 것인지가 궁금해!

    recommendCadidates = set()
    authorIndices = pickBestAuthors(uGradesAuthorsfor1User)

    for author in authorIndices:
        if authors[author] - set(ucRatingsfor1User) == set():
            assert False
        recommendCadidates |= authors[author] - set(ucRatingsfor1User)

    return recommendCadidates



def pickBestAuthors(uGradesAuthorfor1User):

    grading = uGradesAuthorfor1User.tolist()
    authorIndices = maxValueIndex(grading, numofSimilars(2, len(grading)))
    return authorIndices

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
"""