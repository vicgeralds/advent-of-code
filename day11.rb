stones = "5688 62084 2 3248809 179 79 0 172169".split(" ").map { |s| s.to_i }

(1..25).each do
  stones = stones.flat_map { |stone|
    length = stone.to_s.length
    if stone == 0
      1
    elsif length % 2 == 0
      [
        stone.to_s[0, length / 2].to_i,
        stone.to_s[length / 2, length].to_i
      ]
    else
      [ stone * 2024 ]
    end
  }
end

puts "How many stones will you have after blinking 25 times?"
puts stones.length

$memos = []

def blink_at(stone, times)
  if times == 0
      return 1
  end
  memo = $memos[times]
  if memo == nil
    $memos[times] = {}
  elsif memo[stone]
    return memo[stone]
  end

  if stone == "0"
    count = blink_at("1", times - 1)
  elsif stone.length % 2 == 0
    count = blink_at(stone[0, stone.length / 2], times - 1) +
      blink_at(stone[stone.length / 2, stone.length].to_i.to_s, times - 1)
  else
    count = blink_at((stone.to_i * 2024).to_s, times - 1)
  end

  $memos[times][stone] = count
  return count
end

stones = stones.join(" ").split(" ")
total_count = 0

stones.each do |stone|
  total_count += blink_at(stone, 50)
end

puts "How many stones would you have after blinking a total of 75 times?"
puts total_count
