#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  n = a.size
  return 0 if n < 4

  # Initialize arrays to store maximum sums ending at and starting from each position
  x_to_y_sums = Array.new(n, 0) # max sum ending at i (from left to right)
  z_to_y_sums = Array.new(n, 0) # max sum starting at i (from right to left)

  # Calculate maximum sums ending at each position from left to right
  (1..n-2).each do |idx|
    x_to_y_sums[idx] = [a[idx], x_to_y_sums[idx-1] + a[idx]].max
  end

  # Calculate maximum sums starting at each position from right to left
  # downto: Most efficient, no array creation
  (n-2).downto(1) do |idx|
    z_to_y_sums[idx] = [a[idx], z_to_y_sums[idx+1] + a[idx]].max
  end

  p x_to_y_sums
  p z_to_y_sums
  max_slice = 0
  (1..n-2).each do |idx|
    max_slice = [max_slice, x_to_y_sums[idx-1] + z_to_y_sums[idx+1]].max
  end

  max_slice
end

# Claude AI solution
def solution2(a)
  n = a.length
  return 0 if n <= 3

  left_sums = Array.new(n, 0)
  right_sums = Array.new(n, 0)

  (1..n-2).each do |i|
    left_sums[i] = [0, left_sums[i-1] + a[i]].max
  end

  # downto: Most efficient, no array creation
  # Also efficient using step: Also no array creation: (n-2).step(1, -1)
  (n-2).downto(1).each do |i|
    right_sums[i] = [0, right_sums[i+1] + a[i]].max
  end

  # Find the maximum double slice sum
  max_double_slice = 0
  (1..n-2).each do |i|
    max_double_slice = [max_double_slice, left_sums[i-1] + right_sums[i+1]].max
  end

  max_double_slice
end

# Analysis
# Detected time complexity:
# O(N)
# Example tests
# ▶example
# example test✔OK
# Correctness tests
# ▶simple1
# first simple test✔OK
# ▶simple2
# second simple test✔OK
# ▶simple3
# third simple test✔OK
# ▶negative
# all negative numbers✔OK
# ▶positive
# all positive numbers✔OK
# ▶extreme_triplet
# three elements✔OK
# Performance tests
# ▶small_random1
# random, numbers form -10**4 to 10**4, length = 70✔OK
# ▶small_random2
# random, numbers from -30 to 30, length = 300✔OK
# ▶medium_range
# -1000, ..., 1000✔OK
# ▶large_ones
# random numbers from -1 to 1, length = ~100,000✔OK
# ▶large_random
# random, length = ~100,000✔OK
# ▶extreme_maximal
# all maximal values, length = ~100,000✔OK
# ▶large_sequence
# many the same small sequences, length = ~100,000
#

args = [
  [3, 2, -6, 4, 0],
  [1, 2, 3, 4, 5],
  [1, 2, 3, 2, 1],
  [3, 2, 6, -1, 4, 5, -1, 2],
  [-1, -2, -3, -4, -5, -6],
  [-6, -5, -4, -3, -2, -1]
]

args.each do |arg|
  p '----'
  p "#1 - #{arg}"
  p solution(arg)
  p "#2 - #{arg}"
  p solution2(arg)
end
