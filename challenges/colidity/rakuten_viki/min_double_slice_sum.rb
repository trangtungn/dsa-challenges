#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  n = a.length
  return 0 if n < 5

  # Create arrays to store minimum sums when breaking at each position
  left_min = Array.new(n, 0)   # Min sum when breaking at position i from left
  right_min = Array.new(n, 0)  # Min sum when breaking at position i from right

  # Calculate minimum values from left to right
  (1..n-2).each do |i|
    left_min[i] = [left_min[i-1] + a[i], a[i]].min
  end

  # Calculate minimum values from right to left
  (n-2).downto(1) do |i|
    right_min[i] = [right_min[i+1] + a[i], a[i]].min
  end

  # Find the minimum sum of two non-adjacent elements
  min_sum = Float::INFINITY
  (1..n-3).each do |i|
    ((i+2)..n-2).each do |j|
      current_sum = left_min[i] + right_min[j]
      min_sum = [min_sum, current_sum].min
    end
  end

  min_sum
end

args = [
  [5, 2, 4, 6, 3, 7]
]

args.each do |arg|
  p '----'
  p "#1 - #{arg}"
  p solution(arg)
end
