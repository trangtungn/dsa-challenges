#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(a)
  sorted_arr = a.sort
  n = sorted_arr.size

  [
    sorted_arr[n - 1] * sorted_arr[n - 2] * sorted_arr[n - 3],
    sorted_arr[n - 1] * sorted_arr[1] * sorted_arr[0]
  ].max
end

# not as optimal as the above solution
def solution2(a)
  arr = a.sort
  n = arr.size
  max_product = arr[n - 1] * arr[n - 2] * arr[n - 3]

  3.times do
    first = arr.shift
    arr << first

    product = arr[n - 1] * arr[n - 2] * arr[n - 3]

    max_product = product if product > max_product
  end

  max_product
end

args = [
  [-5, 5, -5, 4],
  [1, 2, 3],
  [2, 5, 0, 1, 2, 3],
  [-3, 1, 2, -2, 5, 6],
  [-3, 0, 1],
  [-3, -1, 0],
  [-3, 0, 1, 2],
  [-3, -1, 0, 2],
  [-10, -2, -1, 2]
]

args.each do |arg|
  p "#1 - #{arg}"
  p solution(arg)
  p "#2 - #{arg}"
  p solution2(arg)
end
