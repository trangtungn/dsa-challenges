#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  n = a.length

  return 0 if n < 3

  sorted_arr = a.sort.reverse
  (0..n - 3).each do |i|
    break if sorted_arr[i + 2].zero? || sorted_arr[i + 2].negative?

    if sorted_arr[i] + sorted_arr[i + 1] > sorted_arr[i + 2] &&
       sorted_arr[i + 1] + sorted_arr[i + 2] > sorted_arr[i] &&
       sorted_arr[i + 2] + sorted_arr[i] > sorted_arr[i + 1]
      return 1
    end
  end

  0
end

def solution2(a)
  n = a.length
  return 0 if n < 3

  sorted_a = a.sort
  for i in 0..(n - 3) do
    return 1 if (sorted_a[i] + sorted_a[i + 1] > sorted_a[i + 2]) && (sorted_a[i + 2] + sorted_a[i + 1] > sorted_a[i]) && (sorted_a[i] + sorted_a[i + 2] > sorted_a[i + 1])
  end

  0
end

# Possible Analysis summary
# The following issues have been detected: wrong answers.

# For example, for the input [5, 3, 3] the solution returned a wrong answer (got 0 expected 1).

# Possible Analysis
# expand allExample tests
# ▶example
# example, positive answer, length=6✔OK
# ▶example1
# example, answer is zero, length=4✔OK
# expand allCorrectness tests
# ▶extreme_empty
# empty sequence✘WRONG ANSWER
# got 0 expected 1
# ▶extreme_single
# 1-element sequence✘WRONG ANSWER
# got 0 expected 1
# ▶extreme_two_elems
# 2-element sequence✘WRONG ANSWER
# got 0 expected 1
# ▶extreme_negative1
# three equal negative numbers✘WRONG ANSWER
# got 0 expected 1
# ▶extreme_arith_overflow1
# overflow test, 3 MAXINTs✘WRONG ANSWER
# got 0 expected 1
# ▶extreme_arith_overflow2
# overflow test, 10 and 2 MININTs✘WRONG ANSWER
# got 0 expected 1
# ▶extreme_arith_overflow3
# overflow test, 0 and 2 MAXINTs✘WRONG ANSWER
# got 0 expected 1
# ▶medium1
# chaotic sequence of values from [0..100K], length=30✘WRONG ANSWER
# got 0 expected 1
# ▶medium2
# chaotic sequence of values from [0..1K], length=50✘WRONG ANSWER
# got 0 expected 1
# ▶medium3
# chaotic sequence of values from [0..1K], length=100✘WRONG ANSWER
# got 0 expected 1
# expand allPerformance tests
# ▶large1
# chaotic sequence with values from [0..100K], length=10K✘WRONG ANSWER
# got 0 expected 1
# ▶large2
# 1 followed by an ascending sequence of ~50K elements from [0..100K], length=~50K✘WRONG ANSWER
# got 0 expected 1
# ▶large_random
# chaotic sequence of values from [0..1M], length=100K✘WRONG ANSWER
# got 0 expected 1
# ▶large_negative
# chaotic sequence of negative values from [-1M..-1], length=100K✘WRONG ANSWER
# got 0 expected 1
# ▶large_negative2
# chaotic sequence of negative values from [-10..-1], length=100K✘WRONG ANSWER
# got 0 expected 1
# ▶large_negative3
# sequence of -1 value, length=100K✘WRONG ANSWER
# got 0 expected 1

args = [
  [],
  [3, 3, 3],
  [5, 3, 3],
  [10, 2, 5, 1, 8, 20],
  [10, 50, 5, 1],
  [0, 1, 2],
  [0, 0, 2],
  [1, 1, 2, 3, 4]
]

args.each do |arg|
  p "#1 - #{arg}"
  p solution(arg)
end
