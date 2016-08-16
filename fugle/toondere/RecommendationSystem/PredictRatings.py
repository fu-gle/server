import numpy as np

underPoint = 100000

def predictRatingsforAll(ucRatings, simsUsers, candidates):
    '''
    # ucRatings : ((사용자 하나, 만화 수)) = 별점
    # simsUsers : ((사용자 수, 사용자 수)) = 유사도
    # candidates : [{추천할 만화 per 사용자}, ...]
    '''
    toonsNPred = []  # [{만화:예상 별점,...}, ... * 사용자 수]

    for targetUser in range(len(ucRatings)):  # 전체 사용자에 대해서
        toonsNPred.append(predictRatingsfor1User(
                        ucRatings, simsUsers, 
                        candidates[targetUser], targetUser))

    return toonsNPred


def predictRatingsfor1User(ucRatings, simsUsers, candifor1User, userNo):
    c = {}  # 만화의 예상 별점을 저장할 사전
    if candifor1User == set():  # 추천해줄 만화가 없다면(만화를 얼마나 본거야)
        # TODO : 다른 방식의 추천..!? 과연 해줄 것이 있을까
        return c

    for toons in candifor1User:  # 사용자별 추천 목록의 만화에 대해서 
        ind = (ucRatings[: ,toons] > 0)  # 만화를 평가한 사용자만 골라냄
        # 정규화에 필요한 값 normal과 예상 별점 값 prediction
        normal = np.sum(simsUsers[userNo, ind])
        # if normal == 0.0:   # TODO : 아무도 보지 않은 만화일 때 (장르에서)
        #     assert False
        prediction = np.dot(simsUsers[userNo, ind],
                            ucRatings[ind, toons]) / normal
        if np.isnan(prediction):
            prediction = 0.0

        # 만화에 해당화는 예상 별점 값 저장
        c[toons] = int(prediction * underPoint)

    return c
