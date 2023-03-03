#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require 'set'

def solution(s)
  return 1 if s.empty?

  special_chars = %w[V W]
  open_brackets = ['(']
  close_brackets = [')']
  stack = []
  arr = s.chars # string to array of characters
  arr.each do |item|
    next if special_chars.include?(item)

    if open_brackets.include?(item)
      stack << item
      next
    end

    if close_brackets.include?(item)
      opened = stack.pop
      return 0 if opened.nil?
    end
  end

  stack.empty? ? 1 : 0
end

args = [
  '(()(())())',
  '())',
  '()()',
  '(U)',
  ')a(c)b()',
  '(aaa ()) bbb () ggggg)',
  'adfd(vm)ef(e)',
  'vm',
  'vvvvv',
  'wwww'
]

args.each do |arg|
  p "#1 - #{arg}"
  p solution(*arg)
  # p "#2 - #{arg}"
  # p solution2(arg)
end
