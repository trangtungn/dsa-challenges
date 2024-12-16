#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Implement a min heap with extract_min and insert methods.
#
# Constraints
# Can we assume the inputs are ints?
# Yes
# Can we assume this fits memory?
# Yes
# Test Cases
# Extract min of an empty tree
# Extract min general case
# Insert into an empty tree
# Insert general case (left and right insert)
#           _5_
#         /     \
#        20     15
#       / \    /  \
#      22  40 25

# extract_min(): 5

#           _15_
#         /      \
#        20      25
#       / \     /  \
#      22  40

# insert(2):

#           _2_
#         /     \
#        20      5
#       / \     / \
#      22  40  25  15

class MinHeap
  def initialize
    @heap = []
  end

  def extract_min
    return nil if @heap.empty?

    min = @heap[0]
    last = @heap.pop

    if @heap.any?
      @heap[0] = last
      heapify_down(0)
    end

    min
  end

  def insert(value)
    @heap << value
    heapify_up(@heap.size - 1)
  end

  def to_a
    @heap.dup
  end

  private

  def heapify_up(index)
    parent_index = (index - 1) / 2

    return if parent_index < 0 || @heap[parent_index] <= @heap[index]

    @heap[parent_index], @heap[index] = @heap[index], @heap[parent_index]
    heapify_up(parent_index)
  end

  def heapify_down(index)
    left_child_index = 2 * index + 1
    right_child_index = 2 * index + 2
    smallest_index = index

    if left_child_index < @heap.size && @heap[left_child_index] < @heap[smallest_index]
      smallest_index = left_child_index
    end

    if right_child_index < @heap.size && @heap[right_child_index] < @heap[smallest_index]
      smallest_index = right_child_index
    end

    return if smallest_index == index

    @heap[index], @heap[smallest_index] = @heap[smallest_index], @heap[index]
    heapify_down(smallest_index)
  end
end

# Test cases
heap = MinHeap.new
puts "Extract from empty heap: #{heap.extract_min}" # Output: nil

heap.insert(5)
heap.insert(20)
heap.insert(15)
heap.insert(22)
heap.insert(40)
heap.insert(25)

puts "Heap after insertions: #{heap.to_a}" #Example output (order may vary): [5, 20, 15, 22, 40, 25]

puts "Extract min: #{heap.extract_min}" # Output: 5
puts "Heap after extract min: #{heap.to_a}" #Example output (order may vary): [15, 20, 25, 22, 40]

heap.insert(2)
puts "Heap after inserting 2: #{heap.to_a}" #Example output (order may vary): [2, 20, 15, 22, 40, 25]

heap2 = MinHeap.new
heap2.insert(5)
heap2.insert(3)
heap2.insert(1)
puts "Heap 2: #{heap2.to_a}"
puts "Extract min from heap 2: #{heap2.extract_min}"
puts "Heap 2 after extraction: #{heap2.to_a}"
