#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Determine if a string is a permutation of another string.
# Can we assume the string is ASCII?
# Yes
# Note: Unicode strings could require special handling depending on your language
# Is whitespace important?
# Yes
# Is this case sensitive? 'Nib', 'bin' is not a match?
# Yes
# Can we use additional data structures?
# Yes
# Can we assume this fits in memory?
# Yes
# Edge cases:
# Empty string?
# Null string?
def solution(str1, str2)
  return false if str1.nil? || str2.nil?
  return false if str1.length != str2.length

  str1.chars.sort == str2.chars.sort
end

def solution2(str1, str2)
  return false if str1.nil? || str2.nil?
  return false if str1.length != str2.length

  str1_hash = Hash.new { |hash, key| hash[key] = 0 }
  str1.each_char { |char| str1_hash[char] += 1 }

  str2_hash = Hash.new { |hash, key| hash[key] = 0 }
  str2.each_char { |char| str2_hash[char] += 1 }

  str1_hash == str2_hash
end

args = [
  ["abc", "cba"],
  ["aaa", "aaa"],
  ["abac", "acbA"],
  ["aabb", "bbaa"],
  ["abcb", "cbab"],
  ["Nib", "bin"],
  ["ac t", "c at"],
  ["dog", "doggo"],
]

args.each do |arg|
  p '---'
  p "--- solution(#{arg}) = #{solution(*arg)}"
  p "--- solution2(#{arg}) = #{solution2(*arg)}"
end
