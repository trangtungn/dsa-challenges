#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# My first solution: 54%
def solution(a)
  return 0 if a.length < 3

  peaks = []

  (1..a.length - 2).each do |i|
    peaks << i if a[i] > a[i-1] && a[i] > a[i+1]
  end

  peak_count = peaks.length
  # p a
  # p a.length
  # p peaks

  peak_count.downto(1).each do |n|
    count_slice = 0
    steps = a.length / n
    peaks.each_with_index do |peak_pos, idx|
      p "idx: #{idx} - #{steps * (idx + 1)} - peak_pos: #{peak_pos}"
      if peak_pos >= idx && peak_pos < steps * (idx + 1)
        count_slice += 1 if (idx + 1) * steps > peak_pos && peak_pos >= idx * steps
        next
      else
        break
      end
    end

    return count_slice
  end

  0
end
# Analysis of solution
# Example tests
# ▶example
# example test✔OK
# Correctness tests
# ▶extreme_min
# extreme min test✔OK
# ▶extreme_without_peaks
# test without peaks✔OK
# ▶prime_length
# test with prime sequence length✘WRONG ANSWER
# got 5 expected 1
# ▶anti_bin_search
# anti bin_search test✔OK
# ▶simple1
# simple test✔OK
# ▶simple2
# second simple test✔OK
# Performance tests
# ▶medium_random
# chaotic medium sequences, length = ~5,000✘WRONG ANSWER
# got 0 expected 625
# ▶medium_anti_slow
# medium test anti slow solutions✔OK
# ▶large_random
# chaotic large sequences, length = ~50,000✘WRONG ANSWER
# got 10 expected 5000
# ▶large_anti_slow
# large test anti slow solutions✘WRONG ANSWER
# got 45044 expected 30030
# ▶extreme_max
# extreme max test✘WRONG ANSWER
# got 49999 expected 25000

# Claude AI optimized first solution: 63%
def solution2(a)
  return 0 if a.length < 3

  # Find all peaks in one pass - O(n)
  peaks = []
  (1..a.length - 2).each do |i|
    peaks << i if a[i] > a[i-1] && a[i] > a[i+1]
  end

  return 0 if peaks.empty?

  # Try each possible number of blocks, from max possible down to 1
  max_blocks = peaks.length
  max_blocks.downto(1) do |blocks|
    block_size = a.length / blocks
    block_has_peak = Array.new(blocks, false)

    # Check if each block has at least one peak - O(p) where p is number of peaks
    peaks.each do |peak_pos|
      block_index = peak_pos / block_size
      block_has_peak[block_index] = true
    end

    # If all blocks have peaks, we found our answer
    return blocks if block_has_peak.all?
  end

  0
end
# Analysis summary of solution2
# The following issues have been detected: wrong answers, timeout errors.

# Analysis
# Example tests
# ▶example
# example test✔OK
# Correctness tests
# ▶extreme_min
# extreme min test✔OK
# ▶extreme_without_peaks
# test without peaks✔OK
# ▶prime_length
# test with prime sequence length✘WRONG ANSWER
# got 5 expected 1
# ▶anti_bin_search
# anti bin_search test✔OK
# ▶simple1
# simple test✔OK
# ▶simple2
# second simple test✔OK
# Performance tests
# ▶medium_random
# chaotic medium sequences, length = ~5,000✘WRONG ANSWER
# got 714 expected 625
# ▶medium_anti_slow
# medium test anti slow solutions✘TIMEOUT ERROR
# running time: 0.396 sec., time limit: 0.208 sec.
# ▶large_random
# chaotic large sequences, length = ~50,000✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.
# ▶large_anti_slow
# large test anti slow solutions✘WRONG ANSWER
# got 45044 expected 30030
# ▶extreme_max
# extreme max test✘WRONG ANSWER
# got 49999 expected 25000

# Claude AI optimized second solution
def solution3(a)
  return 0 if a.length < 3

  # Find all peaks in one pass and store in boolean array for O(1) lookup
  n = a.length
  peaks = Array.new(n, false)
  (1..n-2).each do |i|
    peaks[i] = true if a[i] > a[i-1] && a[i] > a[i+1]
  end

  p "peaks: #{peaks}"

  # Create prefix sum array for O(1) peak count queries
  peak_counts = Array.new(n+1, 0)
  1.upto(n) do |i|
    peak_counts[i] = peak_counts[i-1] + (peaks[i-1] ? 1 : 0)
  end

  p "peak_counts: #{peak_counts}"

  # Try each possible divisor of array length
  max_blocks = 0
  i = 1
  while i * i <= n
    # remove this line to get all divisors; otherwise only get square divisors which is wrong
    # next i += 1 unless n % i == 0

    # Check both i and n/i as potential block sizes
    [i, n/i].each do |block_count|
      block_size = n / block_count
      valid = true

      # Check if each block has at least one peak
      block_count.times do |j|
        start_idx = j * block_size
        end_idx = start_idx + block_size
        if peak_counts[end_idx] - peak_counts[start_idx] == 0
          valid = false
          break
        end
      end

      max_blocks = block_count if valid && block_count > max_blocks
    end
    i += 1
  end

  max_blocks
end
# Analysis summary of solution3
# The following issues have been detected: wrong answers.

# Analysis
# Example tests
# ▶example
# example test✔OK
# Correctness tests
# ▶extreme_min
# extreme min test✔OK
# ▶extreme_without_peaks
# test without peaks✔OK
# ▶prime_length
# test with prime sequence length✘WRONG ANSWER
# got 5 expected 1
# ▶anti_bin_search
# anti bin_search test✔OK
# ▶simple1
# simple test✔OK
# ▶simple2
# second simple test✔OK
# Performance tests
# ▶medium_random
# chaotic medium sequences, length = ~5,000✘WRONG ANSWER
# got 714 expected 625
# ▶medium_anti_slow
# medium test anti slow solutions✔OK
# ▶large_random
# chaotic large sequences, length = ~50,000✘WRONG ANSWER
# got 5555 expected 5000
# ▶large_anti_slow
# large test anti slow solutions✔OK
# ▶extreme_max
# extreme max test✘WRONG ANSWER
# got 33333 expected 25000

# Test cases
args = [
  [1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2], # returns 3
  [1, 2, 3, 4, 3, 2, 1, 2, 3, 4, 6, 2], # returns 2
  [1, 2, 3, 4, 3, 2, 1, 2, 3, 4, 6, 2, 6], # returns 2
  [1, 4, 3, 4, 3, 2, 1, 2, 3, 4, 6, 2, 6] # returns 2
]

args.each do |arg|
  puts '--------------------------------'
  puts arg.inspect
  puts "Solution 1: #{solution(arg)}"
  puts "Solution 2: #{solution2(arg)}"
  puts "Solution 3: #{solution3(arg)}"
end
