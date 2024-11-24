#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(aa, ab, bb)
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
  p "--- #{arg.join(" ")}"
  p solution(*arg)
end
