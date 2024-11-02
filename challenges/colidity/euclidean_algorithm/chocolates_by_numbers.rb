#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# My first `solution`: 62%
def solution(n, m)
  count = 0
  gcd = find_gcd(n, m)

  # p "gcd: #{gcd}"
  (0..n - 1).each do |i|
    next if i % gcd != 0
    # p "- i: #{i}"
    count += 1
  end

  count
end

def find_gcd(a, b)
  if a == 0
    return b
  end

  find_gcd(b % a, a)
end

# Analysis summary of the solution
# The following issues have been detected: timeout errors.

# For example, for the input (1000000000, 1) the solution exceeded the time limit.

# Analysis
# Detected time complexity:
# O(N + M)
# Example tests
# ▶example
# example test✔OK
# Correctness tests
# ▶extreme_small
# very small N and M✔OK
# ▶simple
# simple test, N = 24, M = 18✔OK
# ▶small1
# small tests✔OK
# ▶small2
# small tests✔OK
# Performance tests
# ▶medium
# medium tests✔OK
# ▶large
# large tests✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.
# ▶large2
# N = (3**9)*(2**14), M=(2**14)*(2**14)✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.
# ▶extreme_large
# maximal and minimal values✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.

# Improved solution: 100%
def solution2(n, m)
  divisor = gcd(n, m)

  # p "divisor: #{divisor}"
  n / divisor
end

def gcd(a, b)
  while !a.zero?
    remainder = b % a
    b = a
    a = remainder
  end

  b
end
# Analysis summary of solution2
# The solution obtained perfect score.

# Analysis
# Detected time complexity:
# O(log(N + M))
# Example tests
# ▶example
# example test✔OK
# Correctness tests
# ▶extreme_small
# very small N and M✔OK
# ▶simple
# simple test, N = 24, M = 18✔OK
# ▶small1
# small tests✔OK
# ▶small2
# small tests✔OK
# Performance tests
# ▶medium
# medium tests✔OK
# ▶large
# large tests✔OK
# ▶large2
# N = (3**9)*(2**14), M=(2**14)*(2**14)✔OK
# ▶extreme_large
# maximal and minimal values✔OK

args = [
  [10, 4],
  [36, 27],
  [1, 9],
]

args.each do |arg|
  puts "=" * 10
  puts "arg: #{arg}"
  puts "Solution: #{solution(*arg)}"
end
