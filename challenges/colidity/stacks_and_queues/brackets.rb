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
  'wwww'
]

args.each do |arg|
  p "#1 - #{arg}"
  p solution(arg)
  # p "#2 - #{arg}"
  # p solution2(arg)
end
