#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a, b, k)
  return (b - a) + 1 if k == 1

  if b == 0
    return 1
  elsif k == b
    return 2 if a == 0

    return 1
  elsif k > b
    return 1 if a == 0

    return 0
  end

  count = (b / k)
  if a == 0
    count += 1
    return count
  end

  if k < a
    remove_count = (a - 1) / k
    count -= remove_count
  end

  count
end

def solution2(a, b, k)
  if a == b
    return (a % k == 0) ? 1 : 0
  elsif a % k == 0
    return (b - a) / k + 1
  else
    return (b - (a - a % k)) / k
  end
end

list_args = [
  [0, 0, 1],
  [3, 3, 5],
  [1, 3, 5],
  [0, 11, 1],
  [1, 11, 1],
  [6, 11, 2],
  [0, 3, 1],
  [2, 11, 4],
  [4, 11, 8],
  [4, 11, 11],
  [3, 11, 2],
  [3, 11, 4],
]

list_args.each do |args|
  p "#1 - #{args}"
  p solution(*args)
  p "#2 - #{args}"
  p solution2(*args)
end
