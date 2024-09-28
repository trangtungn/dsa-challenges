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

def solution1(a)
  sorted_a = a.sort
  sorted_a.each_with_index do |item, index|
    val = index + 1
    next if val == item

    return val
  end

  a.length + 1
end

params = [
  [1],
  [],
  [2, 3],
  [3, 2],
  [2, 5, 3, 1],
  [4, 3, 2, 1],
]

p "solution"
params.each do |param|
  p solution(param)
end

p "solution1"
params.each do |param|
  p solution1(param)
end
