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
end
