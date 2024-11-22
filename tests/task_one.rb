#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(aa, ab, bb)
  return "" if aa == 0 && ab == 0 && bb == 0

  max_no = [aa, ab, bb].max
  ab_arr = Array.new(ab, "AB")
  aa_arr = Array.new(aa, "AA")
  bb_arr = Array.new(bb, "BB")

  arr = []
  max_no.times do |_i|
    arr << ab_arr.shift if arr.last != "BB" && ab_arr.any?
    arr.unshift(ab_arr.shift) if arr.first != "AA" && ab_arr.any?

    arr << aa_arr.shift if arr.last != "AA" && aa_arr.any?
    arr.unshift(aa_arr.shift) if arr.first != "AB" && arr.first != "AA"  && aa_arr.any?

    arr << bb_arr.shift if arr.last != "BB" && arr.last != "AB" && bb_arr.any?
    arr.unshift(bb_arr.shift) if arr.first != "BB" && bb_arr.any?
  end

  arr.join
end

args = [
  [5, 0, 2],
  [1, 2, 1],
  [0, 2, 0],
  [0, 0, 10],
  [3, 0, 0],
  [4, 0, 1],
  [0, 3, 2],
  [0, 0, 0],
]

args.each do |arg|
  p '---' * 10
  p solution(*arg)
end
