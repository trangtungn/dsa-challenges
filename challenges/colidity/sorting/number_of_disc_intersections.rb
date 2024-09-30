#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require 'set'

def solution(a)
  edges = []
  n = a.size
  (0...n).each do |i|
    edges << [i - a[i], 'head', i]
    edges << [i + a[i], 'tail', i]
  end

  edges.sort!

  count = 0
  stack = Set.new
  edges.each do |edge|
    if edge[1] == 'head'
      count += stack.size
      stack << edge
    else
      stack.delete([edge[2] * 2 - edge[0], 'head', edge[2]])
    end

    return -1 if count > 10_000_000
  end

  count
end

def solution2(a)
  n = a.size
  open_lefts = Array.new(n, 0)
  open_rights = Array.new(n, 0)

  a.each_with_index do |radius, center|
    left = [0, center - radius].max
    right = [n - 1, center + radius].min

    open_lefts[left] += 1
    open_rights[right] += 1
  end

  intersections = 0
  active_circles = 0

  open_lefts.zip(open_rights).each do |left, right|
    intersections += active_circles * left
    intersections += (left * (left - 1)) / 2

    active_circles += left - right

    return -1 if intersections > 10_000_000
  end

  intersections
end

# Use Sweep Line Algorithm
def solution3(a)
  n = a.length
  return 0 if n < 2

  x_pos = []
  a.each_with_index do |item, idx|
    x_pos << [(idx - item), 1] # start position
    x_pos << [(idx + item), -1] # end position
  end

  # sort positions, starts go first
  x_pos.sort_by! { |pos, type| [pos, -type] }

  count = 0
  num_of_started = 0
  x_pos.each do |item, type|
    if type == 1 # start
      count += num_of_started
      num_of_started += 1 # increase
    else
      num_of_started -= 1
    end

    return -1 if count > 10000000
  end

  count
end
# Analysis summary of solution3
# The following issues have been detected: timeout errors.

# Analysis of solution3
# Detected time complexity:
# O(N*log(N)) or O(N)
# expand allExample tests
# ▶example1
# example test✔OK
# expand allCorrectness tests
# ▶simple1✔OK
# ▶simple2✔OK
# ▶simple3✔OK
# ▶extreme_small
# empty and [10]✔OK
# ▶small1✔OK
# ▶small2✔OK
# ▶small3✔OK
# ▶overflow
# arithmetic overflow tests✔OK
# expand allPerformance tests
# ▶medium1✔OK
# ▶medium2✔OK
# ▶medium3✔OK
# ▶medium4✔OK
# ▶10M_intersections
# 10.000.000 intersections✔OK
# ▶big1✔OK
# ▶big2✘TIMEOUT ERROR
# running time: 0.716 sec., time limit: 0.544 sec.
# ▶big3
# [0]*100.000✔OK

args = [
  [1, 5, 2, 1, 4, 0],
  [1, 1, 1],
  [0, 0, 0],
  [1, 2, 3]
]

args.each do |arg|
  p "#1 - #{arg}"
  p 'Use Sweep Line Algorithm'
  p solution(arg)
  p "#2 - #{arg}"
  p solution2(arg)
  p "#3 - #{arg}"
  p solution3(arg)
end
