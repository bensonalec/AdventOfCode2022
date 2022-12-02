from aocd import get_data
data = get_data(day=1, year=2022)

#Part 1
readIn = data.split("\n\n")
print(sum(sorted([sum([int(x) for x in z.strip().split("\n")]) for z in readIn], reverse=True)[0:1]))

#Part 2
readIn = data.split("\n\n")
print(sum(sorted([sum([int(x) for x in z.strip().split("\n")]) for z in readIn], reverse=True)[0:3]))
