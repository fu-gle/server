from operator import itemgetter
underPoint = 100000

def doRecommend(toonsNPred, userNo):
    toonsNPred = sorted(toonsNPred.items(), key=itemgetter(1), reverse=True)
    toonsList = []
    if toonsNPred[userNo] != {}:
        for i in toonsNPred:
            if i[1] > (30 * underPoint):
                toonsList.append([i[0] + 1, i[1]])
    else:
        print("TODO : 추천할 만화가 없어요..")
    print(toonsList)
    return toonsList

def doRecommendfor1User(toonsNPred, userNo):
    # 별점이 높은 순으로 정렬
    toonsNPred = sorted(toonsNPred.items(), key=itemgetter(1), reverse=True)
    toonsList = []
    if toonsNPred != {}:
        for i in toonsNPred:
            if i[1] > (30 * underPoint):
                toonsList.append([i[0] + 1, i[1]])

    else:
        print("TODO : 추천할 만화가 없어요..")
    return toonsList