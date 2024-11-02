#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  diff_list = {}
  nums.each_with_index do |num, idx|
      return [diff_list[num], idx] if diff_list[num]
      diff = target - num
      # p "diff: #{diff}"

      diff_list[diff] = idx
      # p "diff_list: #{diff_list}"
  end

  nil
end

args = [
  [[2,7,11,15], 9],
  [[3,2,4], 6],
  [[3,3], 6],
  [[-1,-2,-3,-4,-5], -8],
]

args.each do |arg|
  puts "=" * 10
  puts "arg: #{arg}"
  puts "Result: #{two_sum(*arg)}"
end
