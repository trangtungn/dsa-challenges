#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  n = a.length

  return 0 if n < 3

  sorted_arr = a.sort.reverse
  (0..n - 3).each do |i|
    break if sorted_arr[i + 2].zero? || sorted_arr[i + 2].negative?

    if sorted_arr[i] + sorted_arr[i + 1] > sorted_arr[i + 2] &&
       sorted_arr[i + 1] + sorted_arr[i + 2] > sorted_arr[i] &&
       sorted_arr[i + 2] + sorted_arr[i] > sorted_arr[i + 1]
      return 1
    end
  end

  0
end

args = [
  [],
  [3, 3, 3],
  [5, 3, 3],
  [10, 2, 5, 1, 8, 20],
  [10, 50, 5, 1],
  [0, 1, 2],
  [0, 0, 2],
  [1, 1, 2, 3, 4]
]

args.each do |arg|
  p "#1 - #{arg}"
  p solution(arg)
end
