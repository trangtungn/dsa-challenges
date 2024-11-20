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

# This is the solution from Claude 3.5
def solution2(aa, ab, bb)
  # Initialize result string
  result = ""

  # Keep track of remaining counts
  counts = {
    "AA" => aa,
    "AB" => ab,
    "BB" => bb
  }

  # Track last two characters to avoid AAA or BBB
  last_two = ""

  while true
    # Try to add a segment based on the last two characters
    added = false

    if last_two == "AA"
      # After AA, we can't add another A
      if counts["BB"] > 0
        result += "BB"
        counts["BB"] -= 1
        added = true
      elsif counts["AB"] > 0
        result += "AB"
        counts["AB"] -= 1
        added = true
      end
    elsif last_two == "BB"
      # After BB, we can't add another B
      if counts["AA"] > 0
        result += "AA"
        counts["AA"] -= 1
        added = true
      elsif counts["AB"] > 0
        result += "AB"
        counts["AB"] -= 1
        added = true
      end
    else
      # We can add any segment, prioritize using AA and BB
      if counts["AA"] > 0 && last_two[-1] != 'A'
        result += "AA"
        counts["AA"] -= 1
        added = true
      elsif counts["BB"] > 0 && last_two[-1] != 'B'
        result += "BB"
        counts["BB"] -= 1
        added = true
      elsif counts["AB"] > 0
        result += "AB"
        counts["AB"] -= 1
        added = true
      end
    end

    break unless added

    # Update last two characters
    last_two = result[-2..-1]
  end

  result
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
  p '====' * 10
  p solution(*arg)
  p solution2(*arg)
end
