#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def my_solution(aa, ab, bb)
  arr = []

  while aa > 0 || bb > 0
    if arr.empty?
      if aa >= bb && aa > 0
        arr << "AA"
        aa -= 1
      elsif bb > aa && bb > 0
        arr << "BB"
        bb -= 1
      end
    else
      if arr.last == "AA" && bb > 0
        arr << "BB"
        bb -= 1
      elsif arr.last == "BB" && aa > 0
        arr << "AA"
        aa -= 1
      elsif arr.first == "AA" && bb > 0
        arr.unshift("BB")
        bb -= 1
      elsif arr.first == "BB" && aa > 0
        arr.unshift("AA")
        aa -= 1
      else
        break
      end
    end
  end

  while ab > 0
    if arr.empty?
      arr << "AB"
    elsif arr.last == "AA"
      arr.unshift("AB")
    elsif arr.last == "BB"
      arr << "AB"
    else
      if arr.first == "AB"
        arr.unshift("AB")
      elsif arr.last == "AB"
        arr << "AB"
      end
    end

    ab -= 1
  end

  arr.join
end

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
    if result.empty? || result.last == "BB"
      result << "AA" 
      remaining_aa -= 1
    end
    if result.first == "BB" && remaining_aa > 0
      result.unshift("AA") 
      remaining_aa -= 1
    end
  elsif remaining_bb > 0
    if result.empty? || result.last == "AA"
      result << "BB"
      remaining_bb -= 1
    end
    if result.first == "AA" && remaining_bb > 0
      result.unshift("BB")
      remaining_bb -= 1
    end
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

args = [
  [5, 0, 2],
  [1, 2, 1],
  [1, 2, 2],
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
  p "==== #{arg}"
  p my_solution(*arg)
  p solution(*arg)
end
