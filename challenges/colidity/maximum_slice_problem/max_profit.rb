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

# This O(n^2) solution is not efficient
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
# Analysis
#
# Detected time complexity:
# O(N**2)
#
# Example tests
# ▶example
# example, length=6✔OK
#
# Correctness tests
# ▶simple_1
# V-pattern sequence, length=7✔OK
# ▶simple_desc
# descending and ascending sequence, length=5✔OK
# ▶simple_empty
# empty and [0,200000] sequence✔OK
# ▶two_hills
# two increasing subsequences✔OK
# ▶max_profit_after_max_and_before_min
# max profit is after global maximum and before global minimum✔OK
#
# Performance tests
# ▶medium_1
# large value (99) followed by short V-pattern (values from [1..5]) repeated 100 times✔OK
# ▶large_1
# large value (99) followed by short pattern (values from [1..6]) repeated 10K times✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.
# ▶large_2
# chaotic sequence of 200K values from [100K..120K], then 200K values from [0..100K]✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.
# ▶large_3
# chaotic sequence of 200K values from [1..200K]✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.

def solution3(a)
  max_profit = 0
  min_bought = a[0]

  i = 1
  n = a.size
  (i...n).each do |idx|
    if a[idx] < min_bought
      min_bought = a[idx]
      next
    end

    diff = a[idx] - min_bought
    max_profit = diff if diff > max_profit
  end

  max_profit
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
  p "#2 O(n^2) problem- #{arg}"
  p solution2(arg)
  p "#3 O(n) - #{arg}"
  p solution3(arg)
end
