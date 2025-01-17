#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a, b, count = 0)
  n = a.size

  return a[0] == b[0] ? -1 : 0 if n == 1

  rotate = false
  n.times do |i|
    next if a[i] != b[i]

    rotate = true
    break
  end

  return count if rotate == false

  last_item = b.pop
  b.unshift(last_item)

  count += 1
  return -1 if count == n

  solution(a, b, count)
end
