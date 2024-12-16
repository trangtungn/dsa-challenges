#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def fib(n)
  return 0 if n == 0
  return 1 if n == 1

  k = fib(n-1) + fib(n-2)
  return k
end

args = [
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10
]

args.each do |arg|
  p "--- fibonacci(#{arg}) = #{fib(*arg)}"
end
