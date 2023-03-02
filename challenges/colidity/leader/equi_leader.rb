#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  n = a.size

  return 0 if n == 1

  candidates = Hash.new(0)
  dominator = nil
  dominator_count = 0

  a.each { |item| candidates[item] += 1 }

  candidates.each do |candidate, count|
    next if count <= n / 2

    dominator = candidate
    dominator_count = count
    break
  end

  return 0 if dominator_count.zero?

  left_dominator_count = 0
  right_dominator_count = 0
  equi_leaders = 0

  (0...n - 1).each do |i|
    if a[i] == dominator
      left_dominator_count += 1
      right_dominator_count = dominator_count - left_dominator_count
    end

    left_count = (i + 1) / 2
    right_count = (n - i - 1) / 2
    equi_leaders += 1 if left_dominator_count > left_count && right_dominator_count > right_count
  end

  equi_leaders
end

args = [
  [1],
  [1, 1],
  [-1, 0],
  [0, 0, 0, 0, -1, -1],
  [0, 0, -1, -1, -1, -1],
  [1, 0, 1, 1, 1],
  [1, 1, 1, 1, 0, 0, 1, 1],
  [4, 3, 4, 4, 4, 2],
  [3, 4, 3, 2, 3, -1, 3, 3]
]

args.each do |arg|
  p "## 1: #{arg}"
  p solution(arg)
  # p "#2 - #{arg}"
  # p solution2(arg)
end
