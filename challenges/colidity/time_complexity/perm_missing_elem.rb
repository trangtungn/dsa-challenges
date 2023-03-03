#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  prev = 0
  sorted_arr = a.sort

  sorted_arr.each do |item|
    return item - 1 if item - prev > 1

    prev = item
  end

  prev + 1
end

params = [
  [1],
  [],
  [2, 3],
  [3, 2],
  [2, 5, 3, 1],
  [4, 3, 2, 1],
]

params.each do |param|
  p solution(param)
end
