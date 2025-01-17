#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true


def my_solution(a, b)
  return false if a.empty? || b.empty?
  return false if b.length > a.length

  idx = 0
  a.each_char do |char_a|
    # p "char_a: #{char_a}, b[idx]: #{b[idx]}"
    if char_a == b[idx]
      idx += 1

      return true if idx == b.length
    end
  end

  false
end

def solution(str_x, str_y)
  x_index = 0
  y_index = 0

  while x_index < str_x.length && y_index < str_y.length
    y_index += 1 if str_x[x_index] == str_y[y_index]
    x_index += 1
  end

  y_index == str_y.length
end

args = [
  ['a', 'a'],
  ['a', 'b'],
  ['a', 'ab'],
  ['ABCD', 'AC'],
  ['ABCD', 'CA'],
  ['ABCAD', 'ABA'],
  ['ABCDEF', 'EF'],
  ['ABCDEF', 'AB'],
  ['ABCDEF', 'BA'],
  # ['ABCDEF', 'ABCDEF'],
  # ['ABCDEF', 'BCDEF'],
]

args.each_with_index do |arg, i|
  p "=== Case #{i + 1}: #{arg.join("  ")}"
  p my_solution(*arg)
  p solution(*arg)
end
