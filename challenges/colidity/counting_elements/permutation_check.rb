#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  return 0 if a.empty?

  arr = a.sort

  return 0 if arr[0] != 1 || arr[arr.length - 1] != arr.length

  (1..(arr.size - 1)).each do |i|
    return 0 if arr[i] - arr[i - 1] != 1
  end

  1
end

args = [
  [0],
  [1],
  [1_000_000_000],
  [2, 4, 6],
  [4, 3, 2, 2, 4],
  [2, 3, 4, 5, 6, 7, 8, 9, 10],
  [22, 32, 42, 52, 62, 72, 82, 92, 10],
  [
    63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84,
    85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100
  ],
]

args.each do |arg|
  p solution(arg)
end