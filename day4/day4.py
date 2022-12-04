
def partOne(inp):
    lines = inp.split("\n")
    count =0
    for i in lines:
        pOne, pTwo = i.split(",")
        firstPair = pOne.split("-")
        firstPair = list(range(int(firstPair[0]), int(firstPair[1])+1))
        secondPair = pTwo.split("-")
        secondPair = list(range(int(secondPair[0]), int(secondPair[1])+1))
        doub = set(firstPair).issubset(set(secondPair))
        trip = set(secondPair).issubset(set(firstPair))
        if(doub or trip):
            count += 1
    print(count)
    pass

def partTwo(inp):
    lines = inp.split("\n")
    count = 0
    for i in lines:
        pOne, pTwo = i.split(",")
        firstPair = pOne.split("-")
        firstPair = list(range(int(firstPair[0]), int(firstPair[1])+1))
        secondPair = pTwo.split("-")
        secondPair = list(range(int(secondPair[0]), int(secondPair[1])+1))
        doub = list(set(firstPair)&(set(secondPair)))
        if(len(doub) >= 1):
            count += 1
    print(count)

#use sample input
with open("sample.txt") as fi:
    readIn = fi.read()
partOne(readIn)
partTwo(readIn)

