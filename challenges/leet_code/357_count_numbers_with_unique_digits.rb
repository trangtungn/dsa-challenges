#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Given an integer n, return the count of all numbers with unique digits, x, where 0 <= x < 10n.
# Example 1:
# Input: n = 2
# Output: 91

# Explanation: The answer should be the total numbers in the range of 0 ≤ x < 100, excluding 11,22,33,44,55,66,77,88,99

# Example 2:
# Input: n = 0
# Output: 1

# Constraints: 0 <= n <= 8

# @param {Integer} n
# @return {Integer}
def count_numbers_with_unique_digits(n)
  return 1 if n == 0 # If n is 0, only number is 0

  # Initialize the result with 1 for x = 0
  result = 1

  # Start calculating for numbers with 1 to n digits
  unique_digits = 9  # Choices for the first digit
  available_digits = 9 # Remaining digits after the first one

  (1..n).each do |i|
    if i == 1
      result += unique_digits
    else
      unique_digits *= available_digits
      result += unique_digits
      available_digits -= 1 # Decrease available digits
    end
  end

  result
end

args = [
  2,
  0,
  3,
  1,
]

args.each do |arg|
  puts "=" * 10
  puts "arg: #{arg}"
  puts "Result: #{count_numbers_with_unique_digits(*arg)}"
end
