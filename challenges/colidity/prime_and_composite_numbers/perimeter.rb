#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true


def solution(n)
  min_perimeter = Float::INFINITY
  a = 1
  while a * a <= n
    if n % a == 0
      b = n / a
      perimeter = (a + b) * 2

      # p "a: #{a} * b: #{b} = #{perimeter}"

      if perimeter < min_perimeter
        min_perimeter = perimeter
      end
    end

    a += 1
  end

  min_perimeter
end

# Analysis FAILED DUE TO THE `MIN_PERIMETER` WAS SET TO 1_000_000_000
# Detected time complexity:
# O(sqrt(N))
# Example tests
# ▶example
# example test✔OK
# Correctness tests
# ▶extreme_min
# N = 1 test✔OK
# ▶simple1
# N = 36 test✔OK
# ▶simple2
# N = 48 test✔OK
# ▶simple3
# N = 101 test✔OK
# ▶small
# N = 1,234 test✔OK
# Performance tests
# ▶medium
# N = 4,564,320 test✔OK
# ▶prime1
# N = 15,486,451 test✔OK
# ▶square
# N = 100,000,000 test✔OK
# ▶prime2
# N = 982,451,653 test✘WRONG ANSWER
# got 1000000000 expected 1964903308
# ▶extreme_max
# N = 1,000,000,000 test✔OK


def solution2(n)
  min_perimeter = Float::INFINITY

  # Only need to check up to square root of n
  (1..Math.sqrt(n)).each do |i|
    next unless (n % i).zero?

    # If i is a factor, n/i is the other factor
    j = n / i
    perimeter = 2 * (i + j)
    min_perimeter = [min_perimeter, perimeter].min
  end

  min_perimeter
end

args = [
  30,
  15,
  9,
  7
]

args.each do |arg|
  p '----'
  p "#1 - #{arg}"
  p solution(arg)
  p "#2 - Claude AI: counting divisors #{arg}"
  p solution2(arg)
end
