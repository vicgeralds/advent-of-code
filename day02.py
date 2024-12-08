reports = []

with open("day02-input.txt", "r") as input_file:
    reports = input_file.read().split("\n")

def is_safe(report: str):
    levels = [int(level) for level in report.split()]
    for index in range(len(levels)):
        levels_copy = levels.copy()
        levels_copy.pop(index)
        if are_safe(levels_copy):
            return True

    return False


def are_safe(levels: list[int]):
    level = levels.pop(0)
    diffs = []
    while levels:
        diffs.append(levels[0] - level)
        level = levels.pop(0)

    all_increasing = all(diff > 0 for diff in diffs)
    all_decreasing = all(diff < 0 for diff in diffs)

    return (all_increasing or all_decreasing) and all(abs(diff) < 4 for diff in diffs)


safe_reports = [
    report
    for report in reports
    if report != "" and is_safe(report)
]

print(len(safe_reports))
