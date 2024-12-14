package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	var topographicMap []string = readPuzzle()
	var totalScore int = 0
	var sumRatings int = 0

	for row := range(len(topographicMap)) {
		cols := findTrailheads(topographicMap[row])
		for _, col := range cols {
			reached := make(map[string]bool)
			score := findTrails(topographicMap, row, col, reached)
			totalScore += score

			sumRatings += findTrails(topographicMap, row, col, nil)
		}
	}

	fmt.Println("What is the sum of the scores of all trailheads on your topographic map?")
	fmt.Println(totalScore)

	fmt.Println("What is the sum of the ratings of all trailheads?")
	fmt.Println(sumRatings)
}

func readPuzzle() []string {
	var lines = make([]string, 0)
	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	return lines
}

func findTrailheads(line string) []int {
	var cols = make([]int, 0)
	for col := range(len(line)) {
		if line[col] == "0"[0] {
			cols = append(cols, col)
		}
	}

	return cols
}

func findTrails(topographicMap []string, row int, col int, reachedHeights map[string]bool) int {
	var count int = 0
	var nextHeight byte = topographicMap[row][col] + 1

	if nextHeight > "9"[0] {
		if reachedHeights != nil {
			key := strconv.Itoa(row) + "," + strconv.Itoa(col)
			if reachedHeights[key] {
				return 0
			}
			reachedHeights[key] = true
		}
		return 1
	}

	for i := -1; i <= 1; i++ {
		if row + i < 0 || row + i >= len(topographicMap) {
			continue
		}
		for j := -1; j <= 1; j++ {
			if !(i == 0 || j == 0) {
				continue
			}
			if col + j < 0 || col + j >= len(topographicMap[row + i]) {
				continue
			}
			if topographicMap[row + i][col + j] == nextHeight {
				count += findTrails(topographicMap, row + i, col + j, reachedHeights)
			}
		}
	}

	return count
}
