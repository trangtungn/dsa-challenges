#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def factorial(n)
  return 1 if n == 0 || n == 1

  n * factorial(n - 1)
end

args = [
  0,
  1,
  2,
  3,
  5
]

args.each do |arg|
  p "--- #{arg}"
  p factorial(*arg)
end
