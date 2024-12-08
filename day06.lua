map = {}

for line in io.lines() do
    table.insert(map, line)
end

map_width = string.len(map[1])

function findGuard ()
    for i, line in ipairs(map) do
        local j = string.find(line, "%^")
        if j then
            return i, j
        end
    end
end

function isOutsideMap (pos)
    local i, j = table.unpack(pos) 
    local line = map[i]

    return not line or j < 1 or j > string.len(line)
end

function markCell (pos)
    local i, j = table.unpack(pos) 
    local line = map[i]

    map[i] = string.sub(line, 1, j - 1) .. "X" .. string.sub(line, j + 1)
end

function getCell (i, j, obstacles)
    local line = map[i]

    if line and j > 0 and j <= map_width then
        local obstacle = obstacles and obstacles[i * map_width + j]
        if obstacle then
            return "#"
        elseif obstacle == false then
            return "-"  -- marks removed obstacle
        end
        return string.sub(line, j, j)
    end
end

function turnRight (dir)
    if dir[1] ~= 0 then
        return {0, -dir[1]}
    else
        return {dir[2], 0}
    end
end

function hasObstacle (i, j, obstacles)
    return getCell(i, j, obstacles) == "#"
end

function findObstacles ()
    local obstacles = {}

    for i, line in ipairs(map) do
        for j = 1, map_width do
            if hasObstacle(i, j) then
                obstacles[i * map_width + j] = true
            end
        end
    end

    return obstacles
end

function move(pos, dir, obstacles)
    local i, j = table.unpack(pos) 
    if hasObstacle(i + dir[1], j + dir[2], obstacles) then
        return pos, turnRight(dir)
    end

    return {i + dir[1], j + dir[2]}, dir
end

function placeObstacle (pos, dir, obstacles)
    local i, j = table.unpack(pos) 
    i = i + dir[1]
    j = j + dir[2]
    if getCell(i, j, obstacles) == "." then
        key = i * map_width + j
        obstacles[key] = true
        return key
    end
end

function getVisitedKey (pos, dir)
    local i, j = table.unpack(pos) 
    return (i * map_width + j) * 16 +
        (dir[1] + 1) +
        (dir[2] + 1) * 4
end

function findLoop (pos, dir, obstacles)
    local obstacle = placeObstacle(pos, dir, obstacles)
    if not obstacle then
        return false
    end

    local visited = {}
    local stuck = false

    while not stuck and not isOutsideMap(pos) do
        local key = getVisitedKey(pos, dir)
        if visited[key] then
            stuck = true
        else
            visited[key] = true
            pos, dir = move(pos, dir, obstacles)
        end
    end

    obstacles[obstacle] = false
    return stuck
end

position = table.pack(findGuard())
direction = {-1, 0}

atStartPosition = true
allObstacles = findObstacles()
countLoops = 0

while not isOutsideMap(position) do
    markCell(position)
    if not atStartPosition and findLoop(position, direction, allObstacles) then
        countLoops = countLoops + 1
    end

    position, direction = move(position, direction)
    atStartPosition = false
end

count = 0
for _, line in ipairs(map) do
    print(line)
    count = count + string.len(string.gsub(line, "[^X]", ""))
end

print("How many different positions could you choose for this obstruction?")
print(countLoops)

print("How many distinct positions will the guard visit before leaving the mapped area?")
print(count)

