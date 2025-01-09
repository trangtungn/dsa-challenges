#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

class MaxHeap
  attr_reader :heap

  def initialize
    @heap = []
  end

  def insert(val)
    @heap << val
    heapify_up(@heap.length - 1)
  end

  def build_heap(arr)
    @heap = arr.dup
    parent_idx = (@heap.length / 2) - 1

    # Start from the last non-leaf node and heapify down
    parent_idx.downto(0) do |i|
      heapify_down(i)
    end
  end

  def to_s
    return if @heap.empty?

    level = 0
    index = 0

    while index < @heap.length
      nodes_in_level = 2**level
      spaces = ' ' * (2**(3 - level))

      nodes_in_level.times do
        break if index >= @heap.length
        print "#{spaces}#{@heap[index]}#{spaces}"
        index += 1
      end
      puts
      level += 1
    end
  end

  private

  def heapify_down(index)
    largest = index
    left = left_child(index)
    right = right_child(index)

    # Compare with left child
    largest = left if left < @heap.length && @heap[left] > @heap[largest]

    # Compare with right child
    largest = right if right < @heap.length && @heap[right] > @heap[largest]

    # If largest is not the current index, swap and continue heapifying
    if largest != index
      @heap[index], @heap[largest] = @heap[largest], @heap[index]
      heapify_down(largest)
    end
  end

  def heapify_up(idx)
    while idx > 0
      parent_idx = parent(idx)
      break if @heap[parent_idx] >= @heap[idx]

      @heap[parent_idx], @heap[idx] = @heap[idx], @heap[parent_idx]
      idx = parent_idx
    end
  end

  def parent(idx)
    (idx - 1) / 2
  end

  def left_child(idx)
    idx * 2 + 1
  end

  def right_child(idx)
    idx * 2 + 2
  end
end

arrays = [
  [19, 36, 100, 17, 3, 25, 1],
  [1, 3, 5, 4, 6, 13, 10, 9, 8, 15, 17]
]

arrays.each do |arr|
  heap = MaxHeap.new
  # arr.each do |num|
  #   p "insert #{num}"
  #   heap.insert(num)
  #   heap.to_s
  # end

  heap.build_heap(arr)
  heap.to_s
end

# Benchmark
puts 'Compare insert and build_heap'
require 'benchmark'

def benchmark_heap_building(size)
  arr = Array.new(size) { rand(1000) }

  Benchmark.bm do |x|
    x.report("insert:") do
      heap = MaxHeap.new
      arr.each { |elem| heap.insert(elem) }
    end

    x.report("build_heap:") do
      heap = MaxHeap.new
      heap.build_heap(arr)
    end
  end
end

benchmark_heap_building(100_000)
