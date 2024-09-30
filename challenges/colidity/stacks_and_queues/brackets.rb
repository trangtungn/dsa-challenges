#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require 'set'

def solution(s)
  brackets = {
    '[' => ']',
    '(' => ')',
    '{' => '}'
  }
  open_brackets = brackets.keys
  close_brackets = brackets.values
  special_chars = %w[V W]

  stack = []
  characters = s.chars # string to character array
  characters.each do |char|
    next if special_chars.include?(char)

    if open_brackets.include?(char)
      stack << char
    elsif close_brackets.include?(char)
      item = stack.pop
      return 0 if brackets[item] != char
    end
  end

  stack.empty? ? 1 : 0
end


def solution2(s)
  open_brackets = {
    "{" => "}",
    "[" => "]",
    "(" => ")",
    "V" => "W"
  }

  brackets = {
    "}" => "{",
    "]" => "[",
    ")" => "(",
    "W" => "V"
  }

  stack = []
  s.each_char do |ch|
    if open_brackets[ch]
      stack << ch
      next
    end

    if brackets[ch]
      val = stack.pop

      if val.nil?
        return 0
      else
       return 0 if val != brackets[ch]
       return 1 if val == 'V' && brackets[ch] != 'W'
      end
    end
  end

  stack.empty? ? 1 : 0
end

# Analysis summary
# The solution obtained perfect score.

# Analysis
# Detected time complexity:
# O(N)
# expand allExample tests
# ▶example1
# example test 1✔OK
# ▶example2
# example test 2✔OK
# expand allCorrectness tests
# ▶negative_match
# invalid structures✔OK
# ▶empty
# empty string✔OK
# ▶simple_grouped
# simple grouped positive and negative test, length=22✔OK
# expand allPerformance tests
# ▶large1
# simple large positive test, 100K ('s followed by 100K )'s + )(✔OK
# ▶large2
# simple large negative test, 10K+1 ('s followed by 10K )'s + )( + ()✔OK
# ▶large_full_ternary_tree
# tree of the form T=(TTT) and depth 11, length=177K+✔OK
# ▶multiple_full_binary_trees
# sequence of full trees of the form T=(TT), depths [1..10..1], with/without some brackets at the end, length=49K+✔OK
# ▶broad_tree_with_deep_paths
# string of the form [TTT...T] of 300 T's, each T being '{{{...}}}' nested 200-fold, length=120K+

args = [
  '{[()()]}',
  '([)()]',
  '(U)',
  '[U]',
  '{U}',
  '}a{c}b{',
  '{aaa ()) bbb () ggggg} [ddf][',
  'adfd[vm]ef[e]',
  'vm',
  'vvvvv',
  'wwww',
  '',
]

args.each do |arg|
  p "#1 - #{arg}"
  p solution(arg)
  p "#2 - #{arg}"
  p solution2(arg)
end
