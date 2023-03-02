#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  candidates = {}
  half_length = a.length / 2

  a.each_with_index do |item, i|
    candidates[item] = [] if candidates[item].nil?
    candidates[item].push(i)

    return i if candidates[item].length > half_length
  end

  -1
end

# IDEA:
# Notice that if the sequence a0,a1,...,an−1 contains a leader,
# then after removing a pair of elements of different values,
# the remaining sequence still has the same leader.
# Indeed, if we remove two different elements then only one of them
# could be the leader. The leader in the new sequence occurs more
# than n − 1 = n−2 times. Consequently, it is still the leader of
# the new sequence of n − 2 elements. 2
def solution2(a)
  stack = []
  a.each do |item|
    last_item = stack.last

    if last_item.nil?
      stack << item
      next
    end

    if last_item != item
      stack.pop
      next
    end

    stack << item
  end

  candidate = stack.last
  candidate_pos = -1

  half_length = a.length / 2
  count = 0
  a.each_with_index do |item, i|
    next if item != candidate

    count += 1
    return i if count > half_length
  end

  -1
end

args = [
  [],
  [1],
  [-1, 0],
  [3, 4, 3, 2, 3, -1, 3, 3],
  [-3, 4, -3, 2, -3, -1, -3, -3],
  [-3, -2, -1, 0, 1, 2, 3],
]

args.each do |arg|
  p "## 1: #{arg}"
  p solution(arg)
  p "#2 - #{arg}"
  p solution2(arg)
end
