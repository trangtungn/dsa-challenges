#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Implement a function to reverse a string (a list of characters), in-place
# Can we assume the string is ASCII?
# Yes
# Note: Unicode strings could require special handling depending on your language
# Consider string as frozen literal, can we use a list of characters instead?
# Edge cases:
# Empty string?
# Null string?
def solution(str)
  return str if str.nil? || str.empty?
  chars = str.chars

  (0..(chars.size - 1) / 2).each do |i|
    temp = chars[i]
    chars[i] = chars[chars.size - i - 1]
    chars[chars.size - i - 1] = temp
  end

  chars.join
end

args = [
  "foobar", # "raboof"
  "AABBCC", # "CCBBAA"
  "aaa", # "aaa"
  "aaaAAA", # "AAAaaa"
  "abc", # "cba"
  nil, # nil
  "" # ""
]

args.each do |arg|
  p '---'
  p "--- solution(#{arg}) = #{solution(arg)}"
end
