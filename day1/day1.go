package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"
)

func partOne() {
	dat, err := os.ReadFile("./sample.txt")
	if err != nil {
		panic("Couldn't Read In File")
	}
	input := string(dat)
	max := 0
	groups := strings.Split(input, "\n\n")
	for _, x := range groups {
		thisSum := 0
		entries := strings.Split(x, "\n")
		for _, y := range entries {
			intval, err := strconv.Atoi(y)
			if err != nil {
				panic("Couldn't convert value")
			}
			thisSum += intval
		}
		if thisSum > max {
			max = thisSum
		}
	}
	fmt.Println("Part One: ", max)
}

func partTwo() {
	dat, err := os.ReadFile("./sample.txt")
	if err != nil {
		panic("Couldn't Read In File")
	}
	input := string(dat)
	maxValues := [3]int{0, 0, 0}
	groups := strings.Split(input, "\n\n")

	for _, x := range groups {

		thisSum := 0

		entries := strings.Split(x, "\n")
		for _, y := range entries {
			intval, err := strconv.Atoi(y)
			if err != nil {
				panic("Couldn't convert value")
			}
			thisSum += intval
		}

		if thisSum > maxValues[2] {
			if thisSum > maxValues[1] {
				if thisSum > maxValues[0] {
					maxValues[1] = maxValues[0]
					maxValues[0] = thisSum
				} else {
					maxValues[2] = maxValues[1]
					maxValues[1] = thisSum
				}
			} else {
				maxValues[2] = thisSum
			}
		}
	}
	fmt.Println("Part Two: ", maxValues[0]+maxValues[1]+maxValues[2])
}

func main() {
	partOne()
	partTwo()
}
