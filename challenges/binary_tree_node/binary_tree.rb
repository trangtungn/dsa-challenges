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

  # ##################
  # Recursive methods:
  def recursive_search(node, target)
    return false if node.nil?
    return true if node.value == target

    recursive_search(node.left, target) || recursive_search(node.right, target)
  end

  # ##################
  # Depth First methods:
  def dfs(target)
    stack = [@root]

    while !stack.empty?
      node = stack.pop
      return true if node.value == target

      stack << node.left if node.left
      stack << node.right if node.right
    end

    false
  end

  # ##################
  # Breadth First methods:
  def bfs(target)
    queue = [@root]

    while !queue.empty?
      node = queue.shift
      return true if node.value == target

      queue << node.left if node.left
      queue << node.right if node.right
    end

    false
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
target = rand(10)
p "Target: #{target}"
p "Recursively find #{target}: #{tree.recursive_search(tree.root, target)}"
p "Depth First Search for #{target}: #{tree.dfs(target)}"
p "Breadth First Search for #{target}: #{tree.bfs(target)}"

p "Sum tree: #{tree.recurive_sum(tree.root)}"
