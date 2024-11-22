#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def my_solution(aa, ab, bb)
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

# Claude-3.5-sonnet solution - Time and space complexity O(n)
def solution(aa, ab, bb)
  result = []

  # Alternate AA and BB
  min_count = [aa, bb].min
  min_count.times do
    result << "AA" << "BB"
  end

  # Handle remaining AA or BB
  remaining_aa = aa - min_count
  remaining_bb = bb - min_count

  if remaining_aa > 0
    result << "AA" if result.empty? || result.last == "BB"
    result.unshift("AA") if result.first == "BB"
  elsif remaining_bb > 0
    result << "BB" if result.empty? || result.last == "AA"
    result.unshift("BB") if result.first == "AA"
  end

  # Insert AB segments
  ab.times do
    if result.empty? || result.last == "BB" || result.last == "AB"
      result << "AB"
    elsif result.first == "AA" || result.first == "AB"
      result.unshift("AB")
    end
  end

  result.join
end

args.each do |arg|
  p "==== #{arg}"
  p my_solution(*arg)
  p solution(*arg)
end
