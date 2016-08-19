#  트리 노드
class treeNode:
    def __init__(self, nameValue, numOccur, parentNode):
        self.name = nameValue
        self.count = numOccur
        self.nodeLink = None  # 같은 아이템의 다른 노드를 주소
        self.parent = parentNode  # 부모 노드를 가리킴
        self.children = {}  # 이름:자식 노드들의 주소

    def inc(self, numOccur):
        self.count += numOccur

    def disp(self, ind=1):
        print('    ' * ind + str(self.name) + ' ' + str(self.count))
        for child in self.children.values():
            child.disp(ind + 1)

# 각 트랜잭션을 고정 집합으로 만들기
def createInitSet(dataSet):
    rootDict = {}
    for trans in dataSet:
        rootDict[frozenset(trans)] = 1
    return rootDict

def mineTree(inTree, headerTable, minSup, preFix, freqItemList):
    # 헤더 테이블의 맨 아래 부분부터 시작
    bigL = [v[0] for v in sorted(headerTable.items(), key=lambda p:p[1][0])]
    for basePat in bigL:
        newFreqSet = preFix.copy()
        newFreqSet.add(basePat)
        freqItemList.append(newFreqSet)
        parentPaths = findPrefixPath(basePat, headerTable[basePat][1])
        myCondTree, myHead = createTree(parentPaths, minSup)
        # 트리 조건 마이닝
        if myHead != None:
            # print("conditional tree for : " + str(newFreqSet))
            # myCondTree.disp(1)
            mineTree(myCondTree, myHead, minSup, newFreqSet, freqItemList)

    return freqItemList

# 부모 경로 찾기
def findPrefixPath(basePat, treeNode):
    condPats= {}
    while treeNode != None:
        prefixPath = []
        ascendTree(treeNode, prefixPath)
        if len(prefixPath) > 1:
            condPats[frozenset(prefixPath[1:])] = treeNode.count
        treeNode = treeNode.nodeLink
    return condPats

def ascendTree(leafNode, prefixPath):
    if leafNode.parent != None:
        prefixPath.append(leafNode.name)
        ascendTree(leafNode.parent, prefixPath)

#  트리 생성
def createTree(dataSet, minSup=1):
    n = 1
    headerTable = {}

    # 각 아이템의 빈발도 계산, 한차례 headerTable 생성
    for trans in dataSet:
        for item in trans:
            headerTable[item] = \
                    headerTable.get(item, 0) + dataSet[trans]

    # 최소 지지도를 만족하지 못하면 삭제
    l = []
    for k in headerTable.keys():
        if headerTable[k] < minSup:
            l.append(k)
    for k in l:
        del headerTable[k]

    freqItemSet = set(headerTable.keys())
    if len(freqItemSet) == 0:   # 최소 지지도를 만족하는 것이 없다면 종료
        return None, None

    for k in headerTable:   # headerTable[k] = [빈발도, 아이템 시작점]
        headerTable[k] = [headerTable[k], None]

    rootTree = treeNode("NULL", 1, None)  # 트리 (root) 생성

    for transSet, count in dataSet.items(): #  트랜잭션 정렬
        localD = {}
        for item in transSet:   # 트랜잭션 아이템 중 헤더에 있는 것 골라냄
            if item in freqItemSet:
                localD[item] = headerTable[item][0]

        if len(localD) > 0:
            orderedItems = [v[0] for v in sorted(
                    localD.items(), key=lambda p:p[1], reverse=True)]
            # 순차적으로 정렬된 빈발 아이템 집합을 트리에 추가
            updateTree(orderedItems, rootTree, headerTable, count)

    return rootTree, headerTable

def updateTree(items, rootTree, headerTable, count):
    if items[0] in rootTree.children:
        rootTree.children[items[0]].inc(count)
    else:
        rootTree.children[items[0]] = \
                    treeNode(items[0], count, rootTree)

        if headerTable[items[0]][1] == None:
            headerTable[items[0]][1] = \
                    rootTree.children[items[0]]
        else:
            # headerTable[items[0]][1] : 이미 입력된 주소
            # rootTree.children[items[0]] : 새로 만든 노드의 주소
            updateHeader(
                    headerTable[items[0]][1], rootTree.children[items[0]])

    if len(items) > 1:
        updateTree(
            items[1:], rootTree.children[items[0]], headerTable, count)

def updateHeader(nodeToTest, targetNode):
    while(nodeToTest.nodeLink != None):
        nodeToTest = nodeToTest.nodeLink
    nodeToTest.nodeLink = targetNode


def tidyFreqList(freqItemList):
    for i in freqItemList:
        freqItemList = [x for x in freqItemList if not i > x]
    return freqItemList
