#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def max_number_of_families(n, reserved_seats)
  seats_per_row = 10
  num_in_group = 4
  groups_per_row = seats_per_row / num_in_group
  max_groups = n * 2

  reserved_hash = Hash.new { |h, k| h[k] = [] }
  reserved_seats.each do |seat|
      reserved_hash[seat[0]] << seat[1]
  end

  total = (n - reserved_hash.size) * 2

  p "reserved_hash: #{reserved_hash}"
  reserved_hash.each do |row, seats|
      # p "row: #{row}"
      start_at = 1
      seats.sort.each do |seat_num|
          avail_count = (seat_num - start_at) / num_in_group
          # additional check equal splits
          if avail_count == 2 && seat_num < 10
              avail_count -= 1
          elsif avail_count == 1 && seat_num < 6
              avail_count -= 1
          end

          total += avail_count
          # p "seat_num: #{seat_num} - start_at: #{start_at} - avail_count: #{avail_count}"
          start_at = seat_num + 1
      end

      right_count = (seats_per_row - start_at) / num_in_group
      # additional check equal splits
      if start_at <= 6 && right_count > 0
          if start_at <= 2
              right_count = 2
          elsif start_at <= 6
              right_count = 1
          end

          total += right_count
      end

      p "row: #{row} - start_at: #{start_at} - avail_count: #{total}"
  end

  total
end


def max_number_of_families_2(n, reserved_seats)
  # Create a hash to store reserved seats by row
  reserved_hash = Hash.new { |h, k| h[k] = [] }
  reserved_seats.each { |row, seat| reserved_hash[row] << seat }

  # Calculate occupied rows count
  occupied_rows = reserved_hash.size
  # Remaining rows can fit 2 families each
  total = (n - occupied_rows) * 2

  reserved_hash.each do |_, seats|
    p "seats: #{seats}"
    # Check if left (2-5), middle (4-7), and right (6-9) sections are available
    left = seats.none? { |s| s.between?(2, 5) }
    middle = seats.none? { |s| s.between?(4, 7) }
    right = seats.none? { |s| s.between?(6, 9) }

    if left && right  # Can fit two families
      total += 2
    elsif left || middle || right  # Can fit one family
      total += 1
    end
  end

  total
end

args = [
  [3, [[1,2],[1,3],[1,8],[2,6],[3,1],[3,10]]],
  [2, [[2,1],[1,8],[2,6]]],
  [4, [[4,3],[1,4],[4,6],[1,7]]],
  [2, [[1,5],[2,8],[2,10],[2,2],[1,6],[1,10],[1,1],[2,5],[1,2]]],
  [2, [[2,1],[1,5],[2,6]]],
  [5, [[4,7],[4,1],[3,1],[5,9],[4,4],[3,7],[1,3],[5,5],[1,6],[1,8],[3,9],[2,9],[1,4],[1,9],[1,10]]],
]

args.each do |arg|
  puts "=" * 10
  puts "arg: #{arg}"
  puts "Result: #{max_number_of_families(*arg)}"
  puts "Result: #{max_number_of_families_2(*arg)}"
end
