#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  n = a.size
  sorted_arr = a.sort
  return 1 if sorted_arr[0] > 1

  (1..(n - 1)).each do |i|
    prev_elem = sorted_arr[i - 1]
    elem = sorted_arr[i]

    next if elem <= 0 || elem == prev_elem

    if prev_elem <= 0
      if elem > 1
        return 1
      else
        next
      end
    end

    return prev_elem + 1 if elem - prev_elem > 1
  end

  return 1 if sorted_arr[n - 1] <= 0

  sorted_arr[n - 1] + 1
end

def solution2(a)
  arr = []
  a.each do |item|
    next if item < 1

    arr[item - 1] = true if arr[item - 1].nil?
  end

  arr.each_with_index do |item, idx|
    return idx + 1 if item.nil?
  end

  arr.length + 1
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
