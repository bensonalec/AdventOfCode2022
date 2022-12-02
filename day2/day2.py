from aocd import lines, submit

def preProcess(inp):
    inp.split("\n")
    data = [line.strip() for line in inp]
    data = [x for x in data if x != ""]
    return data

def partOne(inp):
    pass

def partTwo(inp):
    pass

#use sample input
with open("sample.txt") as fi:
    readIn = fi.read()
partOne(preProcess(readIn))
partTwo(preProcess(readIn))


#submit your input
from aocd import get_data
data = get_data(day=2, year=2022)
submit(partOne(preProcess(data)))
submit(partTwo(preProcess(data)))