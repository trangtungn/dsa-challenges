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
end
