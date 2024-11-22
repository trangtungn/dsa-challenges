#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(aa, ab, bb)
  aa_arr = Array.new(aa, "AA")
  ab_arr = Array.new(ab, "AB")
  bb_arr = Array.new(bb, "BB")

  arr = []
  min_count = [aa, bb].min
  min_count.times do
    arr << aa_arr.shift
    arr << bb_arr.shift
  end

  val = aa_arr.shift || bb_arr.shift
  if val
    if val != arr.last
      arr << val
    elsif val != arr.first
      arr.unshift(val)
    end
  end

  ab_arr.size.times do |_i|
    if arr.empty? || arr.last == "BB" || arr.last == "AB"
      arr << ab_arr.shift
    elsif arr.empty? || arr.first == "AA" || arr.first == "AB"
      arr.unshift(ab_arr.shift)
    end
  end

  # p "#{aa_arr} #{ab_arr} #{bb_arr}"

  arr.join
end

args = [
  [5, 0, 2],
  [1, 2, 1],
  [0, 2, 1],
  [0, 2, 0],
  [0, 0, 10],
  [3, 0, 0],
  [4, 0, 1],
  [0, 3, 2],
  [0, 0, 0],
  [1, 1, 2],
  [6, 3, 5],
  [5, 3, 3],
  [3, 3, 5],
  [2, 3, 5],
]

args.each do |arg|
  p '---' * 10
  p solution(*arg)
end
