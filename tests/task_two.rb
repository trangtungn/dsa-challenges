#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(x, y)
  n = x.size

  counts = Hash.new(0)
  (0...n).each do |i|
    gcd = find_gcd(x[i], y[i])
    k = "#{x[i] / gcd}/#{y[i] / gcd}"

    counts[k] += 1
  end

  # p counts
  counts.values.max
end

def find_gcd(a, b)
  return b if a.zero?

  find_gcd(b % a, a)
end

args = [
  [[1, 2, 3, 4, 0], [2, 3, 6, 8, 4]],
  [[3, 3, 4], [5, 4, 3]],
  [[4, 4, 7, 1, 2], [4, 4, 8, 1, 2]],
  [[1, 2, 3, 1, 2], [2, 4, 6, 5, 10]]
]

args.each_with_index do |arg, i|
  p "=== Case #{i + 1}: #{arg}"
  p solution(*arg)
end
