#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def fibonacci(n)
  return 1 if n == 0 || n == 1

  n * fibonacci(n - 1)
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
  p fibonacci(*arg)
end
