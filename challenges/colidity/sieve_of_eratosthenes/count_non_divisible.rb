#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# My first `solution`: 66%
def solution(a)
  temp_hash = Hash.new
  res = []
  a.each_with_index do |val, idx|
    if temp_hash[val].nil?
      temp_hash[val] = non_divisors(idx, a)
    end

    res << temp_hash[val]
  end

  p res.inspect

  res
end

def non_divisors(cur_idx, arr)
  res = []
  arr.each_with_index do |val, i|
    next if i == cur_idx

    res << arr[i] if arr[cur_idx] % arr[i] != 0
  end

  res.length
end

# Analysis summary of solution
# The following issues have been detected: timeout errors.

# Analysis
# Detected time complexity:
# O(N ** 2)
# Example tests
# ▶example
# example test✔OK
# Correctness tests
# ▶extreme_simple
# extreme simple✔OK
# ▶double
# two elements✔OK
# ▶simple
# simple tests✔OK
# ▶primes
# prime numbers✔OK
# ▶small_random
# small, random numbers, length = 100✔OK
# Performance tests
# ▶medium_random
# medium, random numbers length = 5,000✘TIMEOUT ERROR
# running time: 2.336 sec., time limit: 0.224 sec.
# ▶large_range
# 1, 2, ..., N, length = ~20,000✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.
# ▶large_random
# large, random numbers, length = ~30,000✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.
# ▶large_extreme
# large, all the same values, length = 50,000✔OK

# Claude AI optimized for `solution`: 88%
def solution2(a)
  # Count frequency of each number
  count = Hash.new(0)
  a.each { |num| count[num] += 1 }

  p "count: #{count.inspect}"
  # Find all divisors for each unique number
  divisors = {}
  count.keys.each do |num|
    divisors[num] = find_divisors(num)
  end

  p "divisors: #{divisors.inspect}"

  # Calculate non-divisors for each position
  a.map do |num|
    n = a.length
    div_count = 0

    # Sum up counts of all divisors
    divisors[num].each do |divisor|
      div_count += count[divisor] if count[divisor]
    end

    # Total elements minus divisor count
    n - div_count
  end
end

def find_divisors(n)
  divisors = Set.new
  (1..Math.sqrt(n)).each do |i|
    if (n % i).zero?
      divisors.add(i)
      divisors.add(n / i)
    end
  end
  divisors
end
# Analysis summary of solution2
# The following issues have been detected: timeout errors.

# Analysis
# Detected time complexity:
# O(N * log(N))
# Example tests
# ▶example
# example test✔OK
# Correctness tests
# ▶extreme_simple
# extreme simple✔OK
# ▶double
# two elements✔OK
# ▶simple
# simple tests✔OK
# ▶primes
# prime numbers✔OK
# ▶small_random
# small, random numbers, length = 100✔OK
# Performance tests
# ▶medium_random
# medium, random numbers length = 5,000✔OK
# ▶large_range
# 1, 2, ..., N, length = ~20,000✔OK
# ▶large_random
# large, random numbers, length = ~30,000✘TIMEOUT ERROR
# running time: 0.640 sec., time limit: 0.432 sec.
# ▶large_extreme
# large, all the same values, length = 50,000✔OK

# My second optimized solution: 100% !!!
# By combining the count and divisors in one single loop
def solution3(a)
  elements = Hash.new { |hash, key| hash[key] = [] }
  count_elements = Hash.new(0)
  a.each do |val|
    count_elements[val] += 1
    next if elements[val].any?

    elements[val] = divisors(val)
  end

  n = a.length
  a.map do |val|
    count = 0
    elements[val].each do |divisor|
      count += count_elements[divisor]
    end

    n - count
  end
end

def divisors(elem)
  res = []
  i = 1
  while i * i <= elem
    if elem % i == 0
      res << i
      res << elem / i if i * i != elem
    end

    i += 1
  end

  res
end

# Analysis summary of solution3
# The solution obtained perfect score.

# Analysis
# Detected time complexity:
# O(N * log(N))
# Example tests
# ▶example
# example test✔OK
# Correctness tests
# ▶extreme_simple
# extreme simple✔OK
# ▶double
# two elements✔OK
# ▶simple
# simple tests✔OK
# ▶primes
# prime numbers✔OK
# ▶small_random
# small, random numbers, length = 100✔OK
# Performance tests
# ▶medium_random
# medium, random numbers length = 5,000✔OK
# ▶large_range
# 1, 2, ..., N, length = ~20,000✔OK
# ▶large_random
# large, random numbers, length = ~30,000✔OK
# ▶large_extreme
# large, all the same values, length = 50,000✔OK

args = [
  [3, 1, 2, 3, 6],
  [3, 1, 2, 3, 6, 13],
  [3, 1, 2, 3, 6, 9],
  [5, 9],
]

# puts "Solution3: #{solution3(args[0])}"

args.each do |arg|
  puts "=" * 10
  puts "arg: #{arg}"
  puts "Solution: #{solution(arg)}"
  puts "Solution2: #{solution2(arg)}"
  puts "Solution3: #{solution3(arg)}"
end
