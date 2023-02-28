#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Demo Code Challenge

# If number, add to result.
# If D, double the last number in result
# If C, remove the last number in result
# If +, add 2 last numbers in result and add the total to result

# 1. input array: ["A", "D", "C", 5, 2, "+"]
# 	result: [5, 2, 7]
# 1. input array: ["A", "D", "C", 5, 2, "+", "D"]
# 	result: [5, 2, 49]
# 1. input array: ["A", "D", "C", 5, 2, "+", "D", "C"]
# 	result: [5, 2]

def run_test(input_arr)
  result = []

  while input_arr.any?
    operation = input_arr.shift

    if operation.is_a?(Integer) && operation.between?(-3 * 104, 3 * 104)
      result << operation
    elsif operation == 'C' && !result.empty?
      result.pop
    elsif operation == 'D' && !result.empty?
      val = result.pop
      result << val**2
    elsif operation == '+' && result.length > 1
      result << result.last(2).sum
    end
  end

  result
end

instructions = ['A', 'D', 'C', 5, 2, '+']
p run_test(instructions)

instructions = ['A', 'D', 'C', 5, 2, '+', 'D']
p run_test(instructions)

instructions = ['A', 'D', 'C', 5, 2, '+', 'D', 'C']
p run_test(instructions)
