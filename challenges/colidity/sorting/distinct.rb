#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require 'set'

def solution(a)
  n = a.size
  set = Set.new
  (0..n - 1).each do |i|
    set << a[i]
  end

  set.size
end

args = [
  [2, 5, 0, 4, 5, 6]
]

args.each do |arg|
  p "#1 - #{arg}"
  p solution(arg)
end
