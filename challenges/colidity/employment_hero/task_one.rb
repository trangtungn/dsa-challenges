#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# USE array.index for better search performance
def solution(a, b)
  return false if a.empty? || b.empty?

  i = 0 # Index to keep track of current position in a
  b.each_char do |char|
    # Search for the current character in a, starting from the current index
    idx = a.index(char, i)
    return false if idx.nil? # If the character is not found, return false

    # If the character is found, update the current index to continue searching from the next position
    i = idx + 1
  end
  # If all characters are found in the correct order, return true
  true
end

def solution2(a, b)
  arr_a = a.chars
  arr_b = b.chars
  return false if arr_a.empty? || arr_b.empty?

  na = arr_a.size
  nb = arr_b.size

  return false if nb > na

  k = 0
  arr_b.each do |char_b|
    result = false
    (k...na).each do |i|
      next if arr_a[i] != char_b

      result = true
      k = i + 1
      break
    end

    return false if result == false
  end

  true
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
  p '#1 ---- '
  p solution(*arg)
  p '#2 ---- '
  p solution2(*arg)
end
