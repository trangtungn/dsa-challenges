#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  max_sum = a[0]
  n = a.size
  # return max_sum if n < 2

  slice_sum = a[0]
  i = 1
  (i..n - 1).each do |idx|

    total = slice_sum + a[idx]

    if a[idx] > total
      slice_sum = a[idx]
    else
      slice_sum = total
    end

    max_sum = slice_sum if max_sum < slice_sum
  end

  max_sum
end

# Claude AI solution
def solution2(a)
  # Initialize variables to track current and maximum sums
  max_ending = max_slice = a[0]

  # Iterate through array starting from second element
  (1...a.length).each do |i|
      # For each position, decide whether to:
      # 1. Start a new slice from current element
      # 2. Extend previous slice by adding current element
      max_ending = [a[i], max_ending + a[i]].max

      # Keep track of the maximum slice sum seen so far
      max_slice = [max_slice, max_ending].max
  end

  max_slice
end

# Analysis
# Detected time complexity:
# O(N)
# Example tests
# ▶example✔OK
# Correctness tests
# ▶one_element✔OK
# ▶two_elements✔OK
# ▶three_elements✔OK
# ▶simple✔OK
# ▶extreme_minimum✔OK
# ▶fifty_random✔OK
# ▶neg_const✔OK
# ▶pos_const✔OK
# Performance tests
# ▶high_low_1Kgarbage✔OK
# ▶1Kgarbage_high_low✔OK
# ▶growing_saw✔OK
# ▶blocks✔OK
# ▶growing_negative✔OK
#
args = [
  [4, 0, -6, 3, 2],
  [0, 4, -6, 3, 2],
  [-2, -1, 0, 1, 2],
  [-1, -2, 0, 1, 2],
  [3, 2, -6, 0, 4],
  [3, 2, -2, 0, 4]
]

args.each do |arg|
  p '----'
  p "#1 - #{arg}"
  p solution(arg)
  p "#2 - #{arg}"
  p solution2(arg)
end
