#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def convert_seat_to_number(seat_letter)
  # Convert A-J to 1-10
  'ABCDEFGHIJ'.index(seat_letter) + 1
end

def solution(n, reserved_seats)
  # Convert reserved seats string to hash of arrays of numbers
  reserved = {}
  reserved_seats.split.each do |seat|
    row = seat[0..-2].to_i
    col = convert_seat_to_number(seat[-1])
    reserved[row] ||= []
    reserved[row] << col
  end

  p "reserved: #{reserved}"
  total_groups = 0

  (1..n).each do |row|
    row_seats = reserved[row] || []
    groups_in_row = 0

    # Check left group (1,2,3,4)
    if (row_seats & [1, 2, 3, 4]).empty?
      groups_in_row += 1
    end

    # Check middle group (4,5,6,7)
    if (row_seats & [4, 5, 6, 7]).empty?
      groups_in_row += 1
    end

    # Check right group (6,7,8,9,10)
    if (row_seats & [6, 7, 8, 9, 10]).empty?
      groups_in_row += 1
    end

    total_groups += [groups_in_row, 2].min
  end

  total_groups
end

# My solution: Currently wrong in one case
def my_solution(n, s)
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
  [3, "1B 1C 1H 2F 3A 3J"],
  [2, "2A 1H 2F"],
  [4, "4C 1D 4F 1G"],
  [2, "1E 1F 2A 2B 2C 2D 2E 2F 2G 2H"],
  [2, "2A 1E 2F"],
  [20, "10A 10D 10H"],
]

args.each do |arg|
  puts "=" * 10
  puts "arg: #{arg}"
  puts "Result: #{solution(*arg)}"
  puts "My Solution Result: #{my_solution(*arg)}"
end
