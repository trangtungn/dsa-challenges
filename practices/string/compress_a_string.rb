#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Compress a string such that 'AAABCCDDDD' becomes 'A3BC2D4'. Only compress the string if it saves space
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
def solution(str)
  return str if str.nil? || str.empty?

  char_set = Hash.new { |hash, key| hash[key] = 0 }
  str.each_char do |char|
    char_set[char] += 1
  end

  res = []
  char_set.each do |char, count|
    res << (count > 1 ? "#{char}#{count}" : char)
  end

  res.join
end

def solution2(str)
  return str if str.nil? || str.empty?

  i = 0
  count = 1
  res = [str[0]]
  (1..str.size - 1).each do |j|
    if str[j - 1] == str[j]
      count += 1
      res[i + 1] = count
    else
      count = 1
      res << str[j]
      i = res.size - 1
    end
  end

  res.join
end

args = [
  "DDDDCCBAA", # "D4C2BA2"
  "AAABCCDDDD", # "A3BC2D4"
  "AABBCC", # "AABBCC"
  "abc", # "abc"
  "aaa", # "a3"
  "aaaAAA", # "a3A3"
  "abc", # "abc"
  nil, # nil
  "" # ""
]

args.each do |arg|
  p '---'
  p "--- solution(#{arg}) = #{solution(arg)}"
  p "--- solution2(#{arg}) = #{solution2(arg)}"
end
