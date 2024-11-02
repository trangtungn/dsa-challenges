#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  max = 0
  checked = {}

  a.each do |val|
    if checked[val]
      if checked[val].abs > max
        max = checked[val].abs
      end

      next
    end

    diff = 0 - val
    checked[diff] = val
  end

  max
end

args = [
  [3, 2, -2, 5, -3],
  [1, 1, 2, -1, 2, -1],
  [1, 2, 3, -4],
  [-1, -4, -2, -3, -4],
  [-1, -4, -2, -8, 0, 1],
  [0, 0, 0, 0, 0],
]

args.each do |arg|
  puts "=" * 10
  puts "arg: #{arg}"
  puts "Solution: #{solution(arg)}"
end
