#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Implement an algorithm to determine if a string has all unique characters.
# Constraints
# Can we assume the string is ASCII?
# Yes
# Note: Unicode strings could require special handling depending on your language
# Can we assume this is case sensitive?
# Yes
# Can we use additional data structures?
# Yes
# Can we assume this fits in memory?
# Yes
# Edge cases:
# Empty string? True or false?
# Null string?
def solution(str)
  return false if str.nil?
  return true if str.empty?
  # If string length exceeds ASCII character set size, there must be duplicates
  return false if str.length > 128


  char_set = {}
  str.each_char do |char|
    return false if char_set[char]

    char_set[char] = true
  end

  true
end

def solution2(str)
  str.chars.uniq.length == str.length
end

args = [
  "abc",
  "aaa",
  "abac",
  "aabb",
  "abcb",
  "abcabc",
  "abccba",
  "abcabcabc",
  "abcabcabcabc",
]

args.each do |arg|
  p "--- solution(#{arg}) = #{solution(*arg)}"
end
