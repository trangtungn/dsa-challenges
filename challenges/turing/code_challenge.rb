#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Code Challenge
# arr = [
#   [00, 01, 02, 03],
#   [10, 11, 12, 13],
#   [20, 21, 22, 23]
# ]

def scan(arr)
  result = []

  arr.each_with_index do |sub_arr, i|
    result << []
    sub_arr.each_with_index do |elem, j|
      val = elem

      # left
      val += (arr[i][j - 1] * 2) if j.positive? && arr[i][j - 1].odd?

      # top left
      val += arr[i - 1][j - 1] if i.positive? && j.positive? && arr[i - 1][j - 1].even?

      # top
      val += (arr[i - 1][j] * 2) if i.positive? && arr[i - 1][j].odd?

      # top right
      val += arr[i - 1][j + 1] if i.positive? && j < sub_arr.length - 1 && arr[i - 1][j + 1].even?

      # right
      val += (arr[i][j + 1] * 2) if j < sub_arr.length - 1 && arr[i][j + 1].odd?

      # bottom right
      val += arr[i + 1][j + 1] if i < arr.length - 1 && j < sub_arr.length - 1 && arr[i + 1][j + 1].even?

      # bottom
      val += (arr[i + 1][j] * 2) if i < arr.length - 1 && arr[i + 1][j].odd?

      # bottom left
      val += arr[i + 1][j - 1] if i < arr.length - 1 && j.positive? && arr[i + 1][j - 1].even?

      result[i][j] = val
    end
  end

  result
end

arr = [
  [0, 1, 2, 3],
  [10, 11, 12, 13],
  [20, 21, 22, 23]
]

p scan(arr)
