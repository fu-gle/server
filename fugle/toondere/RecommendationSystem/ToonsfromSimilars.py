import numpy as np

def toonsfromSimilars(ucRatings, similarUsers):
    '''
    # ucRatings : ((사용자 하나, 만화 수)) = 별점 행렬
    # similarUsers : [[유사한 사용자 번호, ...] ... * 전체 사용자 수]
    '''
    candidates = []  # 사용자별 추천해 줄 만화 목록

    for userNo in range(len(ucRatings)):  # 전체 사용자에 대해서
        candidates.append(set())  # 사용자별 추천해줄 만화들의 집합 선언

        recommendCandidate = toonsfromSimilarsfor1User(
                                ucRatings, similarUsers[userNo], userNo)

        if recommendCandidate == set():  # 유사한 사용자에게서 추천 받을 수 없을 때
            # TODO : 다른 방식의 추천 준비
            print("유사한 사용자보다 만화를 많이 봤음")

        candidates[userNo] |= recommendCandidate  # 결과 저장

    return candidates

def toonsfromSimilarsfor1User(ucRatings, simUserIndices, userNo):
    '''
    # ucRatings : ((사용자 하나, 만화 수)) = 별점 행렬
    # simUserIndices : 한 사용자와 유사한 사용자들의 번호 
    # userNo : 사용자 번호
    '''
    recommendCandidate = set()
    # userNo 사용자가 본 만화
    ratedbyTarget = set(np.nonzero(ucRatings[userNo])[0][:])

    for simUser in simUserIndices:  # 사용자와 유사한 한 명의 사용자에 대해
        # TODO : 다른 방식의 추천 준비 - 유사한 사용자가 0명이 아닐 수도 있음 ㅜㅠ
        if simUser == -1:  # 유사한 사용자 없음
            break
        # 유사한 사용자가 본 만화들의 집합
        ratedbySimilar = set(np.nonzero(
                                ucRatings[simUser])[0][:])
        # 사용자가 보지 않은 만화만 걸러내기
        recommendCandidate |= ratedbySimilar - ratedbyTarget

    return recommendCandidate
