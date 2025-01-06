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

  def recurive_sum(node)
    return 0 if node.nil?

    recurive_sum(node.left) + recurive_sum(node.right) + node.value.to_i
  end

  def recursive_min(node, min = Float::INFINITY)
    return min if node.nil?

    [recursive_min(node.left, min), recursive_min(node.right, min), node.value].min
  end

  def recursive_max_path_sum(node)
    return 0 if node.nil?

    node.value + [recursive_max_path_sum(node.left), recursive_max_path_sum(node.right)].max
  end

  def recursive_level_count(node, level = 0)
    return level if node.nil?

    level += 1

    [recursive_level_count(node.left, level), recursive_level_count(node.right, level)].max
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

  def dft_sum
    total = 0
    stack = [@root]
    while !stack.empty?
      node = stack.pop
      total += node.value.to_i if node.value

      stack << node.left if node.left
      stack << node.right if node.right
    end

    total
  end

  def dft_min
    min = @root.value || Float::INFINITY
    stack = [@root]
    while !stack.empty?
      node = stack.pop
      min = node.value < min ? node.value : min

      stack << node.left if node.left
      stack << node.right if node.right
    end

    min
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

  def bf_sum
    total = 0
    queue = [@root]
    while !queue.empty?
      node = queue.shift
      total += node.value.to_i if node.value

      queue << node.left if node.left
      queue << node.right if node.right
    end

    total
  end

  def bft_min
    min = @root.value || Float::INFINITY
    queue = [@root]
    while !stack.empty?
      node = queue.shift
      min = node.value < min ? node.value : min

      queue << node.left if node.left
      queue << node.right if node.right
    end

    min
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
p "DF Sum tree: #{tree.dft_sum}"
p "BF Sum tree: #{tree.bf_sum}"

p "Recursive Min Value: #{tree.recursive_min(tree.root, tree.root.value)}"
p "DFT Min Value: #{tree.dft_min}"

p "Recurive Max Path Sum: #{tree.recursive_max_path_sum(tree.root)}"

root = Node.new(-5)
node11 = Node.new(11)
node3 = Node.new(-3)

node4 = Node.new(4)
node15 = Node.new(-15)
node12 = Node.new(12)

root.add_left(node11)
root.add_right(node3)
node11.add_left(node4)
node11.add_right(node15)
node3.add_right(node12)

node14 = Node.new(14)
node12.add_right(node14)

tree = BinaryTree.new(root)
tree.to_s
target = rand(20)
p "Target: #{target}"
p "Recursively find #{target}: #{tree.recursive_search(tree.root, target)}"
p "Depth First Search for #{target}: #{tree.dfs(target)}"
p "Breadth First Search for #{target}: #{tree.bfs(target)}"

p "Sum tree: #{tree.recurive_sum(tree.root)}"
p "DF Sum tree: #{tree.dft_sum}"
p "BF Sum tree: #{tree.bf_sum}"

p "Min Value in tree: #{tree.recursive_min(tree.root, tree.root.value)}"
p "DFT Min Value: #{tree.dft_min}"

p "Recurive Max Path Sum: #{tree.recursive_max_path_sum(tree.root)}"
p "Recurive Level Count: #{tree.recursive_level_count(tree.root)}"
