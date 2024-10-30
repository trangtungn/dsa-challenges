#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true


def solution2(a, b)
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

# Claude AI solution
def solution3(x, y)
  # Initialize pointer for y
  j = 0
  y_len = y.length

  # If y is empty, it's technically a subsequence
  return true if y_len.zero?

  # Iterate through string x
  x.each_char do |char|
    # If we find a matching character, move to next character in y
    if char == y[j]
      j += 1
      # If we've matched all characters in y, we're done
      return true if j == y_len
    end
  end

  # If we haven't found all characters in y, return false
  false
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
  p "=== Case #{i + 1}: #{arg}"
  p '#2 ---- My solution'
  p solution2(*arg)
  p '#3 ---- Claude AI'
  p solution3(*arg)
end
