const pairs = `3   4
4   3
2   5
1   3
3   9
3   3`.split('\n')

const leftList = pairs.map(pair => +pair.split(/ +/)[0])
const rightList = pairs.map(pair => +pair.split(/ +/)[1])

leftList.sort()
rightList.sort()

const sum = values => values.reduce((a, b) => a + b)

sum(
    leftList.map((val, index) => Math.abs(val - rightList[index]))
)

const rightCount = {}
for (const value of rightList) {
    rightCount[value] = (rightCount[value] || 0) + 1
}

sum(
    leftList.map(value => value * (rightCount[value] || 0))
)
