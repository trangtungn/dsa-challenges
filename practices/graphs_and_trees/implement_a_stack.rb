#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Implement a stack with push, pop, peek, and is_empty methods using a linked list.
# If we pop on an empty stack, do we return None?
# Yes
# Can we assume this fits memory?
# Yes
# Test Cases
# Push
# Push to empty stack
# Push to non-empty stack
# Pop
# Pop on empty stack
# Pop on single element stack
# Pop on multiple element stack
# Peek
# Peek on empty stack
# Peek on one or more element stack
# Is Empty
# Is empty on empty stack
# Is empty on one or more element stack

class Node
  attr_accessor :data, :next

  def initialize(data, next_node = nil)
    @data = data
    @next = next_node
  end
end

class Stack
  def initialize
    @top = nil
  end

  def push(data)
    node = Node.new(data, @top)
    @top = node
  end

  def pop
    return nil if @top.nil?

    data = @top.data
    @top = @top.next
    data
  end

  def peek
    return nil if @top.nil?

    @top.data
  end

  def is_empty?
    @top.nil?
  end
end

stack = Stack.new
p stack.is_empty?
p stack.push(1)
p stack.peek
p stack.is_empty?
p stack.push(2)
p stack.pop
p stack.is_empty?
p stack.pop
p stack.is_empty?
p stack.pop
p stack.is_empty?
