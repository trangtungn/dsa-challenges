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

p solution [0, 1]
p solution [0, 1, 0]
p solution [1, 0]
p solution [-1, 0, 1]
p solution [3, 2, 1, 0, 5]
