#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Write a function solution(x, y) that, given a string x and a string y, returns a boolean that checks whether all of the characters in the string y exist at some point in the string x. Furthermore, the characters from y need to occur in the same order in x. There may be additional characters in string x, so long as each character from y appears and the order is maintained.
# If all of the characters from y appear in x in the correct order return the boolean true, otherwise return false
# Both of the input strings will consist of alpha-numeric characters only. The length of the strings may be quite large so performance should be a consideration for your solution.
# Example 1
#     x= "ABCD" y = "AC"
# Result=true
# The expected result is true because "A" and "C" both appear in "ABCD" and in that order.
# Example 2
#     x = "ABCD" y = "CA"
# Result false
# The expected result is false because even though "C" and "A" both appear in "ABCD" the order is in x is different to y.
# Example 3
#     x="ABCAD y = "BA"
# Result true
# The expected result is true because "B" and "A" both appear in "ABCAD". Note, the first "A" appears before the "B" but then there is a subsequent "A" so the result should be true.

# Solution A
def solution_a(str_x, str_y)
  str_x_length = str_x.length
  str_y_length = str_y.length
  return false if str_x_length.zero? || str_y_length.zero? || str_x_length < str_y_length

  y_index = 0
  0.step(str_x_length - 1) do |i|
    break if i == str_x_length

    y_index += 1 if str_x[i] == str_y[y_index]
  end

  y_index == str_y_length
end

# Solution B
def solution_b(str_x, str_y)
  x_index = 0
  y_index = 0

  while x_index < str_x.length && y_index < str_y.length
    y_index += 1 if str_x[x_index] == str_y[y_index]
    x_index += 1
  end

  y_index == str_y.length
end

# Test cases
p solution_d('ABCD', 'AC') # true
p solution_d('ABCD', 'CA') # false
p solution_d('ABCAD', 'BA') # true
p solution_d('ABCAD', 'ABCADDFEEF') # false
p solution_d('ABADEFDFE', 'A') # true
p solution_d('ABADEFDFE', 'AC') # false
p solution_d('ABADEFDFE', 'CA') # false
