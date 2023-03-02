#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  n = a.length
  prefix_sums = Array.new(n + 1) { 0 }

  (1..n).each do |i|
    prefix_sums[i] = prefix_sums[i - 1] + a[i - 1]
  end

  min_avg = Float::INFINITY
  min_pos = 0
  (0..(n - 2)).each do |i|
    ((i + 1)..(n - 1)).each do |j|
      avg = (prefix_sums[j + 1] - prefix_sums[i]).to_f / (j + 1 - i)
      if avg < min_avg
        min_avg = avg
        min_pos = i
      end
    end
  end

  min_pos
end

# One approach to solve this problem is to iterate through all possible slices,
# calculate their averages and return the starting position of the slice with
# the minimum average. However, this approach has a time complexity of O(N^2)
# which is not efficient for large inputs.

# A better approach is to notice that the minimal average slice must have length
# 2 or 3. This can be proved as follows:

# Let's consider a slice of length L > 3 with a minimal average. We can divide it
# into two smaller slices: one with length 2 and the other with length L-2. Since
# the slice has minimal average, the average of the smaller slice with length 2
# must be less than or equal to the average of the original slice. Hence, the slice
# with minimal average must have length 2 or 3.

# Therefore, we only need to consider slices of length 2 and 3. For each starting
# position i, we calculate the averages of the slices (i, i+1) and (i, i+2), and
# return the starting position of the slice with the minimum average.

# Here's the Ruby code:
# The time complexity of this solution is O(N).
def solution1(a)
  n = a.length
  min_avg = (a[0] + a[1]).to_f / 2.0
  min_idx = 0

  for i in 0..n-3 do
    avg2 = (a[i] + a[i + 1]).to_f / 2.0
    avg3 = (a[i] + a[i + 1] + a[i + 2]).to_f / 3.0

    if avg2 < min_avg
      min_avg = avg2
      min_idx = i
    end

    if avg3 < min_avg
      min_avg = avg3
      min_idx = i
    end
  end

  # Check last slice of length 2
  last_avg = (a[n - 2] + a[n - 1]).to_f / 2.0
  if last_avg < min_avg
    min_avg = last_avg
    min_idx = n - 2
  end

  min_idx
end

args = [
  [4, 2, 2, 5, 1, 5, 8],
  [-3, -5, -8, -4, -10]
]

args.each do |arr|
  p "#1 - #{arr}"
  p solution(arr)
  # p "#2 - #{arr}"
  # p solution1(arr)
end
