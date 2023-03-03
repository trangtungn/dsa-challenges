#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require 'set'

def solution(a, b)
  basket = []
  count = 0
  n = a.size
  (0...n).each do |i|
    if b[i] == 1
      basket << [a[i], b[i]]
      next
    end

    while basket.any?
      fish = basket.last

      break if fish[0] > a[i]

      basket.pop
    end

    count += 1 if basket.empty?
  end

  count += basket.count
  count
end

args = [
  [[4, 3, 2, 1, 5], [0, 1, 0, 0, 0]],
  [[3, 4, 2, 1, 5], [1, 1, 1, 1, 0]],
  [[4, 3, 2, 1, 5], [0, 1, 0, 1, 0]],
  [[4, 3, 2, 5, 1], [1, 1, 0, 0, 1]],
  [[4, 5, 2, 6, 1], [1, 1, 0, 0, 1]],
  [[4, 3, 2, 1, 5], [0, 0, 0, 0, 0]],
  [[4, 3, 2, 1, 5], [1, 1, 1, 1, 1]],
  [[4], [0]],
  [[4], [1]]
]

args.each do |arg|
  p "#1 - #{arg}"
  p solution(*arg)
  # p "#2 - #{arg}"
  # p solution2(arg)
end
