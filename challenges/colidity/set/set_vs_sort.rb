#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Write a function:
#   def solution(a)
#
# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
# Given A = [1, 2, 3], the function should return 4.
# Given A = [−1, −3], the function should return 1.
# Write an efficient algorithm for the following assumptions:
# N is an integer within the range [1..100,000]; each element of array A is an integer within the range [−1,000,000..1,000,000].

# Using `sort` and `uniq`
# Sorting would add unnecessary complexity (O(n log n)) to time complexity.
# The time complexity of O(n log n) for solution_a comes primarily from the sorting operation:
#   1. Sorting operation:
#     - The line sorted_arr = arr.sort is the key factor here.
#     - In Ruby, the sort method typically uses a comparison-based sorting algorithm, often a variant of Quicksort or Mergesort.
#     - These comparison-based sorting algorithms have an average and worst-case time complexity of O(n log n), where n is the number of elements in the array.
#   2. Why O(n log n)?
#     - In comparison-based sorting, we need to make comparisons between elements to determine their order.
#     - The most efficient comparison-based sorting algorithms can't do better than O(n log n) in the average and worst cases.
#     - Intuitively, log n represents the number of times you can divide n by 2 before reaching 1, which relates to the depth of the recursion or the number of passes needed in these sorting algorithms.
#   3. The uniq operation:
#     - After sorting, the uniq operation is performed, which has a linear O(n) time complexity.
#     - However, since O(n log n) is larger than O(n), the overall complexity remains O(n log n).
def solution_a(arr)
  sorted_arr = arr.sort.uniq
  smallest_positive_integer = 1

  sorted_arr.each do |num|
    p "num: #{num}"
    break if num.positive? && num != smallest_positive_integer

    next if num.negative? || num.zero?

    smallest_positive_integer += 1
    p "smallest_positive_integer: #{smallest_positive_integer}"
  end

  smallest_positive_integer
end

# Using `Set` and remove zero and negative numbers
# Why Set?
# - A Set in Ruby is an unordered collection of unique elements.
# - Sets are optimized for fast membership testing (the include? operation), not for maintaining order.
# - The include? operation on a Set is O(1) on average, regardless of whether the set is sorted or not.
# More about Set, see challenges/colidity/set/README.md
def solution_b(arr)
  # Create a set of all positive integers in the array
  # Set Creation: O(n)
  #   - a.select(&:positive?) is O(n)
  #   - Creating a Set from this is also O(n)
  positive_set = Set.new(arr.select(&:positive?))

  # Start from 1 and find the first missing positive integer
  # In the worst case, it will iterate up to the maximum value in the input array plus one.
  #
  # p 1.step.take(4) # [1, 2, 3, 4]
  # p 10.step(by: -1).take(4) # [10, 9, 8, 7]
  # 3.step(to: 5) {|i| print i, " " } # 3 4 5
  # 1.step(10, 2) {|i| print i, " " } # 1 3 5 7 9

  1.step do |i|
    return i unless positive_set.include?(i)
  end
end

# Using `sort`
# - O(n log n) due to the sorting operation.
# - O(1) if sorting is done in-place, O(n) if a new array is created for sorting.

def solution_c(a)
  arr = a.sort
  n = arr.size

  min = 0
  (0...n).each do |i|
    next if arr[i] <= 0

    return min + 1 if arr[i] - min > 1

    min = arr[i]
  end

  min + 1
end

args = [
  [1, 3, 6, 4, 1, 2],
  [1, 2, 3],
  [-1, -3],
  [1, 2, 3, 0],
  [0, -1, -3]
]

args.each do |arg|
  p solution(arg)
  p '-' * 10
end

# Set:
#
# 1. Set Implementation in Ruby:
#   - Ruby's Set is typically implemented using a Hash table under the hood. In fact, in Ruby, you can think of a Set as a special kind of Hash where the keys are the set elements and the values are all set to true.
#
# 2. Hash Table Basics:
#   - Hash tables use a hash function to compute an index into an array of buckets or slots, from which the desired value can be found.
#   - Ideally, the hash function assigns each key to a unique bucket, but in practice, it's common to have hash collisions where the hash function generates the same index for more than one key.
#
# 3. O(1) Average Time Complexity:
#   - In a well-implemented hash table, the average time complexity for lookups is O(1).
#   - This is because the hash function directly computes the index where an element should be, allowing immediate access.
#
# 4. How it Works:
#   - When you call `include?` on a Set, it essentially does this:
#     1. Compute the hash of the input value.
#     2. Use this hash to find the corresponding bucket in the underlying array.
#     3. Check if the value exists in that bucket.
#
# 5. Handling Collisions:
#   - Even with collisions, where multiple elements hash to the same bucket, the lookup remains very fast on average.
#   - Common collision resolution techniques like chaining (where each bucket contains a linked list of elements) still provide fast access.
#
# 6. Amortized O(1):
#   - The O(1) time complexity is an amortized average-case scenario.
#   - In the worst case (many collisions), it could theoretically degrade to O(n), but this is extremely rare with a good hash function and proper resizing of the hash table.
#
# 7. Ruby's Optimization:
#   - Ruby's implementation is highly optimized, using techniques like open addressing and power-of-two sizing to make hash operations as efficient as possible.
#
# It's important to note that while we say the lookup is O(1), it's more accurately described as O(1) in the average and amortized case. In practice, for the vast majority of use cases, you can rely on Set lookups being constant time operations.
