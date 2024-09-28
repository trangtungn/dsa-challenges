#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  n = a.size
  last_index = n - 1

  started_at = -1
  total_one = 0
  (0..last_index).each do |i|
    if started_at == -1 && a[i].zero?
      started_at = i
    elsif started_at > -1 && a[i] == 1
      total_one += 1
    end
  end

  return 0 if total_one.zero? || started_at == last_index

  pairs = total_one

  started_at += 1
  return pairs if started_at == last_index

  (started_at..(last_index - 1)).each do |i|
    if a[i].zero?
      pairs += total_one
    elsif a[i] == 1
      total_one -= 1
    end

    return -1 if pairs > 1_000_000_000
  end

  pairs
end


def solution2(a)
  count = 0
  passing_cars = []
  n = a.length
  for i in 0..(n - 2) do
    next if a[i] == 1

    for j in (i + 1)..(n - 1) do
      next if a[j] == 0

      passing_cars << [i, j]
      count += 1
    end
  end

  count > 1000000000 ? -1 : count
end
# Analysis of solution2
# Detected time complexity:
# O(N ** 2)
# expand allExample tests
# ▶example
# example test✔OK
# expand allCorrectness tests
# ▶single
# single element✔OK
# ▶double
# two elements✔OK
# ▶simple
# simple test✔OK
# ▶small_random
# random, length = 100✔OK
# ▶small_random2
# random, length = 1000✔OK
# expand allPerformance tests
# ▶medium_random
# random, length = ~10,000✘TIMEOUT ERROR
# running time: 3.964 sec., time limit: 0.208 sec.
# ▶large_random
# random, length = ~100,000✘TIMEOUT ERROR
# running time: 4.788 sec., time limit: 0.352 sec.
# ▶large_big_answer
# 0..01..1, length = ~100,000✘TIMEOUT ERROR
# running time: 4.608 sec., time limit: 0.352 sec.
# ▶large_alternate
# 0101..01, length = ~100,000✘TIMEOUT ERROR
# running time: 4.556 sec., time limit: 0.352 sec.
# ▶large_extreme
# large test with all 1s/0s, length = ~100,000✘TIMEOUT ERROR
# Killed. Hard limit reached: 6.000 sec.

def solution3(a)
  count = 0
  count_zeros = 0
  count_ones = 0

  a.each do |item|
    item.zero? ? count_zeros += 1 : count_ones += 1
  end

  return 0 if count_zeros.zero? || count_ones.zero?

  a.each do |item|
    if item.zero?
      count += count_ones
    else
      count_ones -= 1
    end
  end

  count > 1000000000 ? -1 : count
end

args = [
  [0],
  [1],
  [1, 0],
  [1, 0, 1],
  [0, 0, 0],
  [1, 1, 1],
  [0, 0, 1, 1],
  [0, 1, 1, 1],
  [0, 0, 0, 1],
  [1, 1, 1, 0],
  [0, 1, 0, 1, 1],
]
args.each do |arg|
  # puts "solution(#{arg}) = #{solution(arg)}"
  # puts "solution2(#{arg}) = #{solution2(arg)}"
  puts "solution3(#{arg}) = #{solution3(arg)}"
end
