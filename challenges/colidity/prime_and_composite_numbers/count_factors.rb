#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(n)
  count = 0
  (1..n).each do |m|
    count += 1 if n % m == 0
  end

  count
end
# Analysis of my solution
# Detected time complexity:
# O(N)
# Example tests
# ▶example1
# example test (N=24=4!)✔OK
# Correctness tests
# ▶squares
# N=16, N=36✔OK
# ▶tiny
# N <= 10✔OK
# ▶simple1
# N=41(prime), N=42✔OK
# ▶simple2
# N=69, N=64, N=120=5!✔OK
# ▶simple3
# N=720=6!, N=1111✔OK
# ▶simple4
# N=5,040=7!, N=12,345✔OK
# ▶simple5
# N=34,879, N=40,320=8!✔OK
# ▶extreme_one
# N=1✔OK
# Performance tests
# ▶medium1
# N=362,880=9!, N=1,948,102✔OK
# ▶medium2
# N=3,628,800=10!, N=5,621,892, N=4,999,696✘TIMEOUT ERROR
# running time: 0.204 sec., time limit: 0.176 sec.
# ▶big1
# N=27,043,111, N=39,916,800=11!, N = 39,992,976✘TIMEOUT ERROR
# running time: 1.284 sec., time limit: 0.176 sec.
# ▶big2
# N=97,093,212, N=2^28✘TIMEOUT ERROR
# running time: 4.356 sec., time limit: 0.176 sec.
# ▶big3
# N=479,001,600=12!, N=780291637(prime), N=449,991,369✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.
# ▶extreme_maxint
# N=1,000,000,000, N=MAX_INT, N=2147,395,600✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.

# Claude AI solution
# More efficient - only check up to square root of n
def solution2(n)
  return 0 if n <= 0

  count = 0
  # Only need to check up to square root of n
  i = 1
  while i * i <= n
    if n % i == 0
      # If i is a factor, both i and n/i are factors
      # Unless i * i = n (perfect square), then count only once
      count += (i * i == n) ? 1 : 2
    end
    i += 1
  end

  count
end

args = [
  24
]

args.each do |arg|
  p '----'
  p "#1 - #{arg}"
  p solution(arg)
end
