#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  n = a.size
  last_index = n - 1

  started_at = -1
  total_one = 0
  (0..last_index).each do |i|
    if started_at == -1 && a[i].zero?
      started_at = i
    elsif started_at > -1 && a[i] == 1
      total_one += 1
    end
  end

  return 0 if total_one.zero? || started_at == last_index

  pairs = total_one

  started_at += 1
  return pairs if started_at == last_index

  (started_at..(last_index - 1)).each do |i|
    if a[i].zero?
      pairs += total_one
    elsif a[i] == 1
      total_one -= 1
    end

    return -1 if pairs > 1_000_000_000
  end

  pairs
end

solution [0]
solution [1]
solution [1, 0]
solution [1, 0, 1]
solution [0, 0, 0]
solution [1, 1, 1]
solution [0, 0, 1, 1]
solution [0, 1, 1, 1]
solution [0, 0, 0, 1]
solution [1, 1, 1, 0]
