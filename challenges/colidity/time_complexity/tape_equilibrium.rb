#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  min = -1
  total = a.sum
  left_total = 0
  right_total = total

  (a.size - 1).times do |i|
    left_total += a[i]
    right_total -= a[i]

    diff = (left_total - right_total).abs
    if min == -1
      min = diff
    else
      min = diff if min > diff
    end
  end

  min
end

def solution2(a)
  n = a.length
  total = a.sum

  min = 2000
  position = 1
  sum1 = a[0]
  while position < n
    sum2 = total - sum1
    diff = (sum2 - sum1).abs
    min = diff if diff < min
    return min if min == 0

    sum1 += a[position]
    position += 1
  end

  min
end

args = [
  [0, 0], # 0
  [1, 1], # 0
  [1, 1, 1], # 0
  [-1, 3],
  [-3, 1],
  [-3, 1, 1],
  [-1, -3, 1],
  [-1, -3, 0, 1],
  [0, 1],
  [0, 1, 0],
  [1, 0],
  [-1, 0, 1],
  [3, 2, 1, 0, 5]
]

args.each do |arg|
  p '======='
  p arg
  p "Solution 1: #{solution(arg)}"
  p "Solution 2: #{solution2(arg)}"
end
