import numpy as np
import scipy

def treeLike(freqSetsList, likeList, userNo):
    userLike = set(likeList[userNo])
    pickedToons = set()
    for aSet in freqSetsList:
        if len(userLike & aSet) / len(aSet) > 0.6:
            pickedToons |= aSet - userLike
    return pickedToons