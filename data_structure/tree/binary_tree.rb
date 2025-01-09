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

  def add_child(val)
    if @left.nil?
      add_left_child(val)
    elsif @right.nil?
      add_right_child(val)
    end
  end

  def add_left_child(val)
    @left = Node.new(val)
  end

  def add_right_child(val)
    @right = Node.new(val)
  end
end

class BinaryTree
  attr_reader :root

  def initialize(arr)
    return if arr.empty?

    build_tree(arr)
  end

  def build_tree(arr)
    add_root(arr[0])
    add_nodes(arr[1..])
  end

  def add_root(val)
    @root = Node.new(val)
  end

  def add_nodes(vals)
    queue = [@root]
    vals.each_slice(2) do |left_val, right_val|
      cur_node = queue.shift
      cur_node.add_left_child(left_val)
      queue << cur_node.left

      cur_node.add_right_child(right_val)
      queue << cur_node.right
    end
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

  def recursive_pick_left(node, arr = [])
    return arr if node.nil?

    if node.left
      arr << node.left.value
      recursive_pick_left(node.left, arr)
    end

    recursive_pick_left(node.right, arr) if node.right

    arr
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
    print_node(node.left, "#{level}-- L ")
    print_node(node.right, "#{level}-- R ")
  end
end

arrays = [
  [3, 1, 5, 2, 7],
  [-5, 11, -3, 4, -15, 12, 14],
  [10, 5, 15, 3, 7, 12, 17, 2, 4, 6, 8, 11, 13, 16, 18]
]

arrays.each do |arr|
  p "Array: #{arr}"
  tree = BinaryTree.new(arr)
  tree.to_s
  target = rand(arr.min..arr.max)
  p "Target: #{target}"
  p "Find #{target} - Recursive: #{tree.recursive_search(tree.root, target)} | Depth First: #{tree.dfs(target)} | Breadth First: #{tree.bfs(target)}"
  p "Sum tree - Recursive: #{tree.recurive_sum(tree.root)} | DFS: #{tree.dft_sum} | BFS: #{tree.bf_sum}"
  p "Min Value - Recursive: #{tree.recursive_min(tree.root, tree.root.value)} | DFT: #{tree.dft_min}"

  p "Max Path Sum - Recurive: #{tree.recursive_max_path_sum(tree.root)}"
  p "Pick Left - Recurive: #{tree.recursive_pick_left(tree.root)}"
end
