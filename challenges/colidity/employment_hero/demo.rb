#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  arr = a.sort
  n = arr.size

  min = 0
  (0...n).each do |i|
    next if arr[i] <= 0

    return min + 1 if arr[i] - min > 1

    min = arr[i]
  end

  min + 1
end

args = [
  [1, 3, 6, 4, 1, 2],
  [1, 2, 3],
  [-1, -3],
  [1, 2, 3, 0],
  [0, -1, -3]
]

args.each do |arg|
  p solution(arg)
  p '-' * 10
end
