import numpy as np
from collections import Counter

# for info in toonsInfo:
#         info['genre'] = set(info['genre'].split(','))
#         info['genre'].remove('')
#         if info['tags'] != None:
#             info['tags'] = info['tags'].split(',')
#             info['tags'].remove('')

'''
# 서버가 DB에서 사용자가 본 만화들에 대한 정보를 쿼리 하나로 갖고 옵니다!
'''
def userTaste(toonsInfo, userNo):
    user = {}
    user['id'] = int(userNo)
    toonTags = []
    platform = [[0, 0], [0, 0], [0, 0]]  # 플랫폼별 본 만화 수, 평균 별점
    platName = ['네이버', '다음', '레진코믹스']
    genre = ['에피소드', '스토리', '공포', '드라마', '무협', '미스터리', '순정', \
             '스릴러', '스포츠', '액션', '일상', '지식', '개그', '판타지', \
             '학원', '성인', '백합', 'BL', '추리', '감성', '시대극',
             '옴니버스', '로맨스', 'SF', '고어', '호러', '역사', '밀리터리']
    # 장르 번호, 평균 점수, 횟수
    genreGrade = [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0],
                  [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0],
                  [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0],
                  [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0],
                  [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0],
                  [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0],
                  [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]]
    for info in toonsInfo:
        # (웹툰만) 네이버, 레진, 다음에 관해 처리
        if info['media'] in platName:
            platNo = platName.index(info['media'])
            platform[platNo][0] += info['star']
            platform[platNo][1] += 1

        # 장르에 대해 처리
        for g in info['genre']:
            genreNo = genre.index(g)
            genreGrade[genreNo][1] += info['star']
            genreGrade[genreNo][2] += 1

        if info['tags'] != None:
            toonTags += info['tags']

    for i in range(3):
        if platform[i][1] != 0:
            platform[i][0] = platform[i][0] / platform[i][1]

    user['naver'] = platform[0]
    user['daum'] = platform[1]
    user['lezhin'] = platform[2]

    no = 0
    for g in genreGrade:
        g[0] = no  # 장르 번호
        if g[2] != 0:
            g[1] = g[1] / g[2]
        no += 1

    # 장르별 본 만화수에 따라 정렬  -- 상위 몇 개만 잘라 써도 무방
    genreGrade = sorted(genreGrade, key=lambda p:p[1], reverse=True)
    user['userGenre'] = genreGrade

    # 이제는 장르별 평균 별점과 본 만화 수를 어떻게 버무릴까.. TODO
    # 하고 사용자 태그 분석.. counter..
    counter = Counter(toonTags)
    user['tags'] = counter.most_common()[:]

    return user

if __name__ == '__main__':
    main()