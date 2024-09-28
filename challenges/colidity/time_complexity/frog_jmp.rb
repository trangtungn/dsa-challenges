#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(x, y, d)
  return 0 if x == y
  return 1 if d > y

  length = y - x
  return 1 if d > length

  even_jumps = length / d
  remainder = length % d

  return even_jumps if remainder.zero?

  even_jumps + 1
end

# NOT VERIFIED yet
def solution2(x, y, d)
  distance = y - x
  (distance / d.to_f).ceil
end

def solution3(x, y, d)
  distance = y - x
  return 0 if distance.zero?

  (distance / d) + (distance % d == 0 ? 0 : 1)
end

solution(1, 1, 20)
solution(1, 1, 1)
solution(1, 2, 1)
solution(1, 2, 1000)
solution(100, 1000, 11)
solution(100, 1000, 9)
