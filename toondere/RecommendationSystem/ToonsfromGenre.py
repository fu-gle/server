import numpy as np
import copy
import math

numofGenre = 20

def toonsfrom1Genre(genres, ucRatings, genreNo, userNo):
    return genres[genreNo] - set(np.nonzero(ucRatings[userNo])[0])

def pickBestGenre(genres, uGradesGenre, userNo):
    grading = uGradesGenre[userNo].tolist()
    genreIndices = maxGenreIndex(
                grading, math.log(numofGenre))

    return genreIndices

def maxGenreIndex(valueList, N):
    '''
    # valueList : uGradesGenre[user]
    # l : 뽑기에서 제외시킬 만화가 3 이하인 장르
    # N : 뽑을 장르의 수
    '''
    tempList = copy.deepcopy(valueList)
    indices = []

    while(len(indices) <= N):
        maxSim = max(tempList)
        if maxSim == 0:
            indices.append(-1)
            return indices

        maxIndex = tempList.index(maxSim)
        tempList[maxIndex] = 0
        indices.append(maxIndex)
    del tempList

    return indices