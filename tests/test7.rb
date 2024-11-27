#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(n, s)
  reserved_seats = map_seat_to_position(s)

  # p "reserved_seats: #{reserved_seats.inspect}"
  total = (n - reserved_seats.size) * 2
  reserved_seats.each do |row, seats|
    start_at = 1
    seats.sort.each do |seat_num|
      avail_count = (seat_num - start_at) / 4
      if avail_count == 2 && seat_num < 10
        avail_count -= 1
      elsif avail_count == 1 && seat_num < 6
        avail_count -= 1
      end

      total += avail_count

      # p "row: #{row} - seat_num: #{seat_num} - start_at: #{start_at} - avail_count: #{avail_count}"
      start_at = seat_num + 1
    end

    right_count = (10 - start_at) / 4

    if start_at <= 6 && right_count > 0
      if start_at <= 2
        right_count = 2
      elsif start_at <=6
        right_count = 1
      end

      total += right_count
    end
  end

  total
end

def map_seat_to_position(s)
  row_positions = {
    "A" => 1,
    "B" => 2,
    "C" => 3,
    "D" => 4,
    "E" => 5,
    "F" => 6,
    "G" => 7,
    "H" => 8,
    "J" => 9,
    "K" => 10
  }

  reserved_seats = Hash.new { |h, k| h[k] = [] }

  s.split(" ").each do |seat|
    reserved_seats[seat[0..seat.length - 1].to_i] << row_positions[seat[-1]]
  end

  reserved_seats
end

args = [
  [2, "1A 2F 1C"],
  [1, ""],
  [22, "1A 3C 2B 20G 5A"]
]

args.each do |arg|
  puts "=" * 10
  puts "arg: #{arg}"
  puts "Solution: #{solution(*arg)}"
end
