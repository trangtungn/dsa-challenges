#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a, b)
  count = 0
  n = a.length
  (0..n - 1).each do |i|
    # p "a[i]: #{a[i]} --- b[i]: #{b[i]}"
    a_primes = prime_divisors(a[i])
    # p "a_primes: #{a_primes.inspect}"

    b_primes = prime_divisors(b[i])
    # p "b_primes: #{b_primes.inspect}"

    count += compare(a_primes, b_primes)
  end

  count
end

def compare(n, m)
  count_n = n.length
  return 0 if count_n != m.length

  (0...count_n).each do |i|
    return 0 if n[i] != m[i]
  end

  return 1
end

def prime_divisors(num)
  primes = []
  divisors = find_primes(num)
  divisors.each do |divisor|
    next if num % divisor != 0

    primes << divisor
  end

  primes
end

def find_primes(num)
  prime_list = Array.new(num + 1, true)
  prime_list[0] = false
  prime_list[1] = false

  (2..Math.sqrt(num)).each do |i|
    next if prime_list[i] == false

    (i * i).step(num, i) do |j|
      prime_list[j] = false
    end
  end

  primes = []
  (2..num).each do |i|
    primes << i if prime_list[i] == true
  end

  primes
end
# Analysis summary
# The following issues have been detected: runtime errors, timeout errors.

# Analysis
# Detected time complexity:
# O(Z * (max(A) + max(B)))
# Example tests
# ▶example
# example test✔OK
# Correctness tests
# ▶extreme
# extreme test with small values✔OK
# ▶simple_1
# simple test with small values✔OK
# ▶simple_2
# simple test with small values✔OK
# ▶primes
# powers of primes✔OK
# ▶small_primes
# small primes✔OK
# ▶small_all_pairs
# all pairs 1-10, length = 100✔OK
# ▶small_random
# small random test, length = 100✔OK
# Performance tests
# ▶large_all_pairs
# all pairs 1-70, length = ~5,000✔OK
# ▶large_random
# large random tests, length = ~6,000✘RUNTIME ERROR
# tested program terminated with exit code 1
# ▶many_factors
# factorial test✘RUNTIME ERROR
# tested program terminated with exit code 1
# ▶many_factors2
# factorial test✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.
# ▶big_powers
# powers of 2 and 3✘RUNTIME ERROR
# tested program terminated with exit code 1
# ▶extreme_maximal
# extreme test with maximal values✘RUNTIME ERROR
# tested program terminated with exit code 1

# Improved the first solution
def solution2(a, b)
  count = 0
  n = a.length
  (0..n - 1).each do |i|
    # p "a[i]: #{a[i]} --- b[i]: #{b[i]}"
    a_primes = prime_factors(a[i])
    # p "a_primes: #{a_primes.inspect}"

    b_primes = prime_factors(b[i])
    # p "b_primes: #{b_primes.inspect}"

    count += compare(a_primes.uniq, b_primes.uniq)
  end

  count
end

def compare(n, m)
  count_n = n.length
  return 0 if count_n != m.length

  (0...count_n).each do |i|
    return 0 if n[i] != m[i]
  end

  return 1
end

def prime_factors(num)
  factors = []

  # Start by dividing out 2 to handle even numbers
  while num % 2 == 0
    factors << 2
    num = num / 2
  end

  # Now, check for odd factors from 3 up to the square root of n
  factor = 3
  while factor * factor <= num
    while num % factor == 0
      factors << factor
      num = num / factor
    end

    factor += 2
  end

  # If there's any prime factor greater than sqrt(n), it must be n itself
  factors << num if num > 2

  factors
end

# Analysis summary of the second solution
# The following issues have been detected: timeout errors.
# Analysis
# Detected time complexity:
# O(Z * (max(A) + max(B))**(1/2))
# expand allExample tests
# ▶example
# example test✔OK
# expand allCorrectness tests
# ▶extreme
# extreme test with small values✔OK
# ▶simple_1
# simple test with small values✔OK
# ▶simple_2
# simple test with small values✔OK
# ▶primes
# powers of primes✔OK
# ▶small_primes
# small primes✔OK
# ▶small_all_pairs
# all pairs 1-10, length = 100✔OK
# ▶small_random
# small random test, length = 100✔OK
# expand allPerformance tests
# ▶large_all_pairs
# all pairs 1-70, length = ~5,000✔OK
# ▶large_random
# large random tests, length = ~6,000✘TIMEOUT ERROR
# running time: 1.512 sec., time limit: 0.256 sec.
# ▶many_factors
# factorial test✔OK
# ▶many_factors2
# factorial test✔OK
# ▶big_powers
# powers of 2 and 3✔OK
# ▶extreme_maximal
# extreme test with maximal values✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.

args = [
  [[15, 10, 9], [75, 30, 5]], # the result should be 1 for the pair 15 and 75
]

args.each do |arg|
  puts "=" * 10
  puts "arg: #{arg}"
  puts "Solution: #{solution(*arg)}"
  puts "Solution 2: #{solution2(*arg)}"
end
