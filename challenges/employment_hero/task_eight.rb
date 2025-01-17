#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Solution by GPT
def solution(arr)
  count = 0

  arr.each do |num|
    unique_digits = {}
    num.to_s.each_char do |digit|
      unique_digits[digit] = true
      break if unique_digits.size > 2 # Stop processing if >2 unique digits
    end

    count += 1 if unique_digits.size <= 2
  end

  count
end

def solution2(numbers)
  # Filter numbers that have 1 or 2 unique digits
  valid_numbers = numbers.select do |num|
    # Convert number to string and get unique digits
    unique_digits = num.to_s.chars.uniq
    # Check if number of unique digits is 1 or 2
    (1..2).include?(unique_digits.length)
  end

  # Return count of valid numbers
  valid_numbers.length
end

args = [
  [11221, 1223, 11, 22, 1122, 44, 1234, 123],
  [11, 22, 33],
  [123, 456, 789],
  [111, 222, 12],
]

args.each do |arg|
  p "======= Case: #{arg}"
  p "-- solution1: #{solution(arg)}"
  p "-- solution2: #{solution2(arg)}"
end
