package main

import (
	"fmt"
	"os"
	"strings"
)

func main() {
	rules := map[string][]string{
		"Rock":     {"Paper", "Rock", "Scissors"},
		"Paper":    {"Scissors", "Paper", "Rock"},
		"Scissors": {"Rock", "Scissors", "Paper"},
	}
	weights := map[string]int{
		"Rock":     1,
		"Paper":    2,
		"Scissors": 3,
	}
	scoreTable := []int{0, 3, 6}
	scoreTableTwo := []string{"X", "Y", "Z"}
	PartOne(rules, weights, scoreTable, scoreTableTwo)
	PartTwo(rules, weights, scoreTable, scoreTableTwo)
}

func indexOf(element string, data []string) int {
	for k, v := range data {
		if element == v {
			return k
		}
	}
	return -1 //not found.
}

func reverseStrings(input []string) []string {
	if len(input) == 0 {
		return input
	}
	return append(reverseStrings(input[1:]), input[0])
}

func PartOne(rules map[string][]string, weights map[string]int, scoreTable []int, scoreTableTwo []string) {
	dat, err := os.ReadFile("./sample.txt")
	if err != nil {
		panic("Couldn't Read In File")
	}
	input := string(dat)
	input = strings.Replace(input, "X", "Rock", -1)
	input = strings.Replace(input, "Y", "Paper", -1)
	input = strings.Replace(input, "Z", "Scissors", -1)
	input = strings.Replace(input, "A", "Rock", -1)
	input = strings.Replace(input, "B", "Paper", -1)
	input = strings.Replace(input, "C", "Scissors", -1)
	lines := strings.Split(input, "\n")
	score := 0
	for _, x := range lines {
		spl := strings.Split(x, " ")
		score += weights[spl[1]] + scoreTable[indexOf(spl[0], rules[spl[1]])]
	}
	fmt.Println(score)
}

func PartTwo(rules map[string][]string, weights map[string]int, scoreTable []int, scoreTableTwo []string) {
	dat, err := os.ReadFile("./sample.txt")
	if err != nil {
		panic("Couldn't Read In File")
	}
	input := string(dat)
	input = strings.Replace(input, "A", "Rock", -1)
	input = strings.Replace(input, "B", "Paper", -1)
	input = strings.Replace(input, "C", "Scissors", -1)
	lines := strings.Split(input, "\n")
	score := 0
	for _, x := range lines {
		spl := strings.Split(x, " ")
		toChoose := rules[spl[0]][indexOf(spl[1], reverseStrings(scoreTableTwo))]
		score += weights[toChoose] + scoreTable[indexOf(spl[1], scoreTableTwo)]
	}
	fmt.Println(score)
}
