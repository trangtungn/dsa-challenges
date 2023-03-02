#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  n = a.size
  return 0 if n.zero? || a == 1

  min_share = a[0]
  max_profit = 0
  (1...n).each do |i|
    if a[i] < min_share
      min_share = a[i]
      next
    end

    diff = a[i] - min_share
    max_profit = diff if diff > max_profit
  end

  max_profit
end

def solution2(a)
  max_profit = 0
  diff = 0

  n = a.size
  (0...n - 1).each do |i|
    (i + 1..n - 1).each do |j|
      diff = a[j] - a[i]
      max_profit = diff if diff >= max_profit
    end
  end

  max_profit.negative? ? 0 : max_profit
end

# A[N] +
# 0 ≤ P ≤ Q < N  +
# profit: A[Q] - A[P] >= 0; loss otherwise
# ? max profit; return 0 if loss or profit = 0
# N in [0..400,000]
# A[i] in [0..200,000]

args = [
  [],
  [1],
  [1, 2],
  [2, 1],
  [5, 4, 3, 4, 5, 1],
  [23171, 21011, 21123, 21366, 21013, 21367]
]

args.each do |arg|
  p '----'
  p "#1 - #{arg}"
  p solution(arg)
  p "#2 - #{arg}"
  p solution2(arg)
end
