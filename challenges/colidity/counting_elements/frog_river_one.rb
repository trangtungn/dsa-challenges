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

p solution(5, [1, 3, 1, 5, 2, 3, 5, 4])
p solution(1, [1, 1])
p solution(3, [2, 2, 1, 1, 3])
p solution(2, [1, 1, 1, 1, 1, 2])
p solution(2, [2, 2, 2, 2, 2, 1])
p solution(5, [5, 3, 5, 5, 2, 3, 5, 4, 2, 4, 2, 3, 3, 1])
p solution(5, [5, 3, 5, 5, 2, 3, 5, 4, 2, 4, 2, 3, 3])
p solution(100, [5, 3, 5, 5, 2, 3, 5, 4, 2, 4, 2, 3, 3])
