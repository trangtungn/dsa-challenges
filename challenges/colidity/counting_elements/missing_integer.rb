#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(arr)
  # Create a hash to mark present numbers
  present = {}

  # Mark all positive numbers as present
  arr.each do |num|
    present[num] = true if num.positive?
  end

  # Find the first missing positive integer
  1.step do |i|
    return i unless present[i]
  end
end

p solution([-3])
p solution([0])
p solution([1])
p solution([2])
p solution([3])
p solution([-3, 0])
p solution([-3, 1])
p solution([-3, 0, 1])
p solution([-1, -3, 2])
p solution([0, 0, 0])
p solution([1, 1, 1])
p solution([2, 3, 2])
p solution([3, 3, 3])
p solution([6, 7, 3])

p '------'
p solution2([-3])
p solution2([0])
p solution2([1])
p solution2([2])
p solution2([3])
p solution2([-3, 0])
p solution2([-3, 1])
p solution2([-3, 0, 1])
p solution2([-1, -3, 2])
p solution2([0, 0, 0])
p solution2([1, 1, 1])
p solution2([2, 3, 2])
p solution2([3, 3, 3])
p solution2([6, 7, 3])
