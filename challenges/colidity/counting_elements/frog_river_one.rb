#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(x, a)
  return -1 if x > a.size

  positions = {}
  counter = 0

  a.each_with_index do |pos, idx|
    if positions[pos].nil?
      positions[pos] = true
      counter += 1
    end

    return idx if counter == x
  end

  -1
end

def solution2(x, a)
  visited = Array.new
  count = 0
  a.each_with_index do |item, index|
    if visited[item - 1] == nil && item <= x
      visited[item - 1] = true
      count += 1
    end

    return index if count == x
  end

  -1
end

def solution3(x, a)
  visited = {}
  a.each_with_index do |item, index|
    if visited[item] == nil && item <= x
      visited[item] = true
    end

    return index if visited.size == x
  end

  -1
end

p '----'
p solution(5, [1, 3, 1, 5, 2, 3, 5, 4])
p solution2(5, [1, 3, 1, 5, 2, 3, 5, 4])
p solution3(5, [1, 3, 1, 5, 2, 3, 5, 4])
p '----'
p solution(1, [1, 1])
p solution2(1, [1, 1])
p solution3(1, [1, 1])
p '----'
p solution(3, [2, 2, 1, 1, 3])
p solution2(3, [2, 2, 1, 1, 3])
p solution3(3, [2, 2, 1, 1, 3])
p '----'
p solution(2, [1, 1, 1, 1, 1, 2])
p solution2(2, [1, 1, 1, 1, 1, 2])
p solution3(2, [1, 1, 1, 1, 1, 2])
p '----'
p solution(2, [2, 2, 2, 2, 2, 1])
p solution2(2, [2, 2, 2, 2, 2, 1])
p solution3(2, [2, 2, 2, 2, 2, 1])
p '----'
p solution(5, [5, 3, 5, 5, 2, 3, 5, 4, 2, 4, 2, 3, 3, 1])
p solution2(5, [5, 3, 5, 5, 2, 3, 5, 4, 2, 4, 2, 3, 3, 1])
p solution3(5, [5, 3, 5, 5, 2, 3, 5, 4, 2, 4, 2, 3, 3, 1])
p '----'
p solution(5, [5, 3, 5, 5, 2, 3, 5, 4, 2, 4, 2, 3, 3])
p solution2(5, [5, 3, 5, 5, 2, 3, 5, 4, 2, 4, 2, 3, 3])
p solution3(5, [5, 3, 5, 5, 2, 3, 5, 4, 2, 4, 2, 3, 3])
p '----'
p solution(100, [5, 3, 5, 5, 2, 3, 5, 4, 2, 4, 2, 3, 3])
p solution2(100, [5, 3, 5, 5, 2, 3, 5, 4, 2, 4, 2, 3, 3])
p solution3(100, [5, 3, 5, 5, 2, 3, 5, 4, 2, 4, 2, 3, 3])
