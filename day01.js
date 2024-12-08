const pairs = `99006   28305
38540   91683
...
47199   88293
20631   56266`.split('\n')

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
