#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Determine if a string s1 is a rotation of another string s2, by calling (only once) a function is_substring.
# Can we assume the string is ASCII?
# Yes
# Note: Unicode strings could require special handling depending on your language
# Is this case sensitive?
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
  return true if str1 == str2

  (str2 + str2).include?(str1)
end

def solution2(str1, str2)
  return false if str1.nil? || str2.nil?
  return false if str1.length != str2.length
  return true if str1 == str2

  n = str1.size
  n.times do
    str1 = str1[1..] + str1[0]
    return true if str1 == str2
  end

  false
end

args = [
  ["abc", "cab"],
  ["abc", "bca"],
  ["aaa", "aaa"],
  ["abc", "bcA"],
  ["aabb", "bbaa"],
  ["abcb", "cbab"],
  ["Nib", "bin"],
  ["ac t", "tac "],
  ["dog", "doggo"],
  [nil, "foo"],
  ["", ""],
  ["foobarbaz", "barbazfoo"],
]

args.each do |arg|
  p '---'
  p "--- solution(#{arg}) = #{solution(*arg)}"
end
