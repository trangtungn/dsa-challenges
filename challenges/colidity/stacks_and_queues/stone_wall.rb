#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(h)
  h.each do |height|
  end
end

def solution2(h)
  stack = []
  count = 0

  h.each do |height|
    while !stack.empty? && stack.last > height
      stack.pop
    end

    if stack.empty? || stack.last < height
      count += 1
      stack.push(height)
    end
  end

  count
end

args = [
  [8, 8, 5, 7, 9, 8, 7, 4, 8]
]

args.each do |arg|
  p "#1 - #{arg}"
  # p solution(arg)
  p "#2 - #{arg}"
  p solution2(arg)
end
