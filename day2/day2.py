rules = {
    "Rock" : ["Paper", "Rock", "Scissors"],
    "Paper": ["Scissors", "Paper", "Rock"],
    "Scissors": ["Rock", "Scissors", "Paper"]
}
weights = {
    "Rock": 1,
    "Paper": 2,
    "Scissors": 3
}

scoreTable = [0, 3, 6]
scoreTableTwo = ["X", "Y", "Z"]

def partOne():
    with open("sample.txt") as fi:
        readIn = fi.read()
    readIn = readIn.replace("X", "Rock")
    readIn = readIn.replace("Y", "Paper")
    readIn = readIn.replace("Z", "Scissors")
    readIn = readIn.replace("A", "Rock")
    readIn = readIn.replace("B", "Paper")
    readIn = readIn.replace("C", "Scissors")
    score = 0
    for i in readIn.split("\n"):
        ans = i.split()
        score += weights[ans[1]] + scoreTable[rules[ans[1]].index(ans[0])]
    print("Part One: ", score)

def partTwo():
    with open("sample.txt") as fi:
        readIn = fi.read()
    readIn = readIn.replace("A", "Rock")
    readIn = readIn.replace("B", "Paper")
    readIn = readIn.replace("C", "Scissors")
    finalScore = 0
    for i in readIn.split("\n"):
        ans = i.split()
        toChoose = rules[ans[0]][scoreTableTwo[::-1].index(ans[1])]
        finalScore += weights[toChoose] + scoreTable[scoreTableTwo.index(ans[1])]
    print("Part Two: ", finalScore)

#use sample input
partOne()
partTwo()