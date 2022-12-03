def getPrio(char):
    if(char.islower()):
        return (ord(char)-96)
    else:
        return (ord(char)-64 + 26)

def partOne(inp):
    lines = inp.split("\n")
    score = 0
    for i in lines:
        halfOne = i[:len(i)//2]
        halfTwo = i[len(i)//2:]
        inCommon=list(set(halfOne)&set(halfTwo))
        for char in inCommon:
            score += getPrio(char)
    print(score)

def partTwo(inp):
    lines = inp.split("\n")
    score, counter = 0
    while(counter < len(lines)):
        sOne = lines[counter]
        sTwo = lines[counter+1]
        sThree = lines[counter+2]
        counter += 3
        inCommon=list(set(sOne)&set(sTwo)&set(sThree))
        for char in inCommon:
            score += getPrio(char)
    print(score)

#use sample input
with open("sample.txt") as fi:
    readIn = fi.read()
partOne(readIn)
partTwo(readIn)