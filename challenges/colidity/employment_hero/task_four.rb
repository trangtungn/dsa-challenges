#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def my_solution(aa, ab, bb)
  arr = []
  min_count = [aa, bb].min
  min_count.times do
    arr << "AA"
    aa -= 1
    arr << "BB"
    bb -= 1
  end

  val = aa > bb ? "AA" : (aa < bb ? "BB" : nil)
  if val
    if val != arr.last
      arr << val
    elsif val != arr.first
      arr.unshift(val)
    end
  end

  ab_arr = []
  ab.times do |_i|
    ab_arr << "AB"
  end

  if arr.empty? ||arr.last == "BB" || arr.last == "AB"
    arr += ab_arr
  elsif arr.first == "AA" || arr.first == "AB"
    arr = ab_arr + arr
  end

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
