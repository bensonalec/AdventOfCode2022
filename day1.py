#Part 1
with open("sample.txt") as fi:
    readIn = fi.read().split("\n\n")
    print(sum(sorted([sum([int(x) for x in z.strip().split("\n")]) for z in readIn], reverse=True)[0:1]))

#Part 2
with open("sample.txt") as fi:
    readIn = fi.read().split("\n\n")
    print(sum(sorted([sum([int(x) for x in z.strip().split("\n")]) for z in readIn], reverse=True)[0:3]))
