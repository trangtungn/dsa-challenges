#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# https://www.youtube.com/watch?v=fAAZixBzIAI&list=TLPQMjAxMjIwMjR4JWIMEnf2ig&index=2
#
class Node
  attr_accessor :left, :right, :value

  def initialize(val)
    @value = val
    @left = nil
    @right = nil
  end

  def add_left(node)
    @left = node
  end

  def add_right(node)
    @right = node
  end
end

class BinaryTree
  attr_reader :root

  def initialize(root)
    @root = root
  end

  # Traversing tree
  def to_s
    print_node(root)
  end

  def print_node(node, level = '')
    return if node.nil?

    puts "#{level}#{node.value}"
    print_node(node.left, "#{level}  ")
    print_node(node.right, "#{level}  ")
  end
end

root = Node.new(3)
node1 = Node.new(1)
node2 = Node.new(2)

node5 = Node.new(5)
node7 = Node.new(7)

root.add_left(node1)
node1.add_left(node2)
root.add_right(node5)
node5.add_left(node7)

tree = BinaryTree.new(root)
tree.to_s
