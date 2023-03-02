#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(n)
  longest = 0
  gap = 0

  binary = n.to_s(2) # convert integer to binary

  p binary

  binary.each_char do |char|
    if char == '1'
      longest = gap if gap > longest

      gap = 0
    else
      gap += 1
    end
  end

  longest
end

args = [
  7, 6, 6172, 9, 529, 20, 15, 32, 1041, 4, 1, 5, 8, 9, 32, 11, 19,
  1_376_796_946, 74_901_729
]

args.each do |arg|
  p solution(arg)
  p '-' * 10
end
