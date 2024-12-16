#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Implement a linked list with insert, append, find, delete, length, and print methods.
# Constraints
# Can we assume this is a non-circular, singly linked list?
# Yes
# Do we keep track of the tail or just the head?
# Just the head
# Can we insert None values?
# No
# Test Cases
# Insert to Front
# Insert a None
# Insert in an empty list
# Insert in a list with one element or more elements
# Append
# Append a None
# Append in an empty list
# Insert in a list with one element or more elements
# Find
# Find a None
# Find in an empty list
# Find in a list with one element or more matching elements
# Find in a list with no matches
# Delete
# Delete a None
# Delete in an empty list
# Delete in a list with one element or more matching elements
# Delete in a list with no matches
# Length
# Length of zero or more elements
# Print
# Print an empty list
# Print a list with one or more elements

class Node
  attr_accessor :data, :next

  def initialize(data, next_node = nil)
    @data = data
    @next = next_node
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def insert(data)
    raise ArgumentError, "Cannot insert nil value" if data.nil?

    node = Node.new(data, @head)
    @head = node
  end

  def append(data)
    raise ArgumentError, "Cannot append nil value" if data.nil?

    new_node = Node.new(data)

    if @head.nil?
      @head = new_node
      return
    end

    current = @head
    current = current.next while current.next
    current.next = new_node
  end

  def find(data)
    return nil if data.nil? || @head.nil?

    current = @head
    while current
      return current if current.data == data
      current = current.next
    end
    nil
  end

  def delete(data)
    return false if data.nil? || @head.nil?

    if @head.data == data
      @head = @head.next
      return true
    end

    current = @head
    while current.next
      if current.next.data == data
        current.next = current.next.next
        return true
      end

      current = current.next
    end

    false
  end

  def length
    count = 0
    current = @head
    while current
      count += 1
      current = current.next
    end

    count
  end

  def print_list
    return "Empty list" if @head.nil?

    result = []
    current = @head
    while current
      result << current.data
      current = current.next
    end
    result.join(" -> ")
  end
end

# Test cases
list = LinkedList.new

# Test empty list
puts "Empty list: #{list.print_list}"
puts "Length: #{list.length}"

# Test insert
list.insert(1)
list.insert(2)
list.insert(3)
puts "\nAfter insertions: #{list.print_list}"
puts "Length: #{list.length}"

# Test append
list.append(4)
list.append(5)
puts "\nAfter appends: #{list.print_list}"

# Test find
node = list.find(3)
puts "\nFind 3: #{node&.data}"
puts "Find 6: #{list.find(6)&.data}"

# Test delete
puts "\nDelete 3: #{list.delete(3)}"
puts "After delete: #{list.print_list}"
puts "Delete 6: #{list.delete(6)}"

# Test error cases
begin
  list.insert(nil)
rescue ArgumentError => e
  puts "\nError handling nil insert: #{e.message}"
end

begin
  list.append(nil)
rescue ArgumentError => e
  puts "Error handling nil append: #{e.message}"
end
