#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Implement a queue with enqueue and dequeue methods using a linked list.
#
# Constraints
# If there is one item in the list, do you expect the first and last pointers to both point to it?
# Yes
# If there are no items on the list, do you expect the first and last pointers to be None?
# Yes
# If you dequeue on an empty queue, does that return None?
# Yes
# Can we assume this fits memory?
# Yes
# Test Cases
# Enqueue
# Enqueue to an empty queue
# Enqueue to a non-empty queue
# Dequeue
# Dequeue an empty queue -> None
# Dequeue a queue with one element
# Dequeue a queue with more than one element

class Node
  attr_accessor :data, :next

  def initialize(data, next_node = nil)
    @data = data
    @next = next_node
  end
end

class Queue
  def initialize
    @first = nil
    @last = nil
  end

  def enqueue(data)
    node = Node.new(data)

    if is_empty?
      @first = node
      @last = node
    else
      @last.next = node
      @last = node
    end

    data
  end

  def dequeue
    return nil if is_empty?

    data = @first.data
    @first = @first.next

    # If queue becomes empty after dequeue
    @last = nil if @first.nil?

    data
  end

  def peek
    return nil if is_empty?

    @first.data
  end

  def is_empty?
    @first.nil?
  end
end

# Test cases
queue = Queue.new

# Test empty queue
puts "Is empty? #{queue.is_empty?}"  # true
puts "Dequeue empty: #{queue.dequeue}"  # nil
puts "Peek empty: #{queue.peek}"  # nil

# Test enqueue to empty queue
puts "\nEnqueue 1: #{queue.enqueue(1)}"
puts "Is empty? #{queue.is_empty?}"  # false
puts "Peek: #{queue.peek}"  # 1

# Test enqueue to non-empty queue
puts "\nEnqueue 2: #{queue.enqueue(2)}"
puts "Peek: #{queue.peek}"  # 1 (still shows first element)

# Test dequeue
puts "\nDequeue: #{queue.dequeue}"  # 1
puts "Peek: #{queue.peek}"  # 2

# Test dequeue until empty
puts "\nDequeue: #{queue.dequeue}"  # 2
puts "Is empty? #{queue.is_empty?}"  # true
puts "Dequeue empty: #{queue.dequeue}"  # nil
