stones = "5688 62084 2 3248809 179 79 0 172169".split(" ").map { |s| s.to_i }

(1..25).each do |i|
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

puts stones.length
