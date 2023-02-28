#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  pair = Hash.new(0)

  a.each do |item|
    next if item % 2 == 0

    pair[item] += 1
    pair.delete(item) if pair[item] % 2 == 0
  end

  pair.keys.first
end

# Wrong solution
def solution2(a)
  unpaired = 0
  a.each do |num|
    unpaired ^= num # using bitwise XOR operator to find unpaired element
  end
  unpaired
end

p solution([1, 5])
p solution2([1, 5])

# p 'Solution 1'
# a = [1]
# p solution(a)
# p '-' * 20
# a = [1, 1, 5]
# p solution(a)
# p '-' * 20
# a = [1, 5, 1]
# p solution(a)
# p '-' * 20
# a = [2, 1, 0]
# p solution(a)
# p '-' * 20
# a = [1, 2, 3, 1]
# p solution(a)
# p '-' * 20
# a = [1, 2, 3, 1]
# p solution(a)
# p '-' * 20
# a = [1, 2, 3, 3, 2]
# p solution(a)
# p '-' * 20
# a = [1, 2, 3, 5, 7, 9]
# p solution(a)
# p '-' * 20

# p 'Solution 2'
# a = [1]
# p solution2([1])
# p '-' * 20
# a = [1, 1, 5]
# p solution2([1, 1, 5])
# p '-' * 20
# a = [1, 5, 1]
# p solution2([1, 5, 1])
# p '-' * 20
# a = [2, 1, 0]
# p solution2([2, 1, 0])
# p '-' * 20
# a = [1, 2, 3, 1]
# p solution2([1, 2, 3, 1])
# p '-' * 20
# a = [1, 2, 3, 1]
# p solution2([1, 2, 3, 1])
# p '-' * 20
# a = [1, 2, 3, 3, 2]
# p solution2([1, 2, 3, 3, 2])
# p '-' * 20
# a = [1, 2, 3, 5, 7, 9, 9, 7, 5, 2, 1]
# p solution2(a)
# p '-' * 20
