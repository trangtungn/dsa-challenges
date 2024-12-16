#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Implement a binary search tree with an insert method.
#
# Constraints
# Can we insert None values?
# No
# Can we assume we are working with valid integers?
# Yes
# Can we assume all left descendents <= n < all right descendents?
# Yes
# Do we have to keep track of the parent nodes?
# This is optional
# Can we assume this fits in memory?
# Yes
# Test Cases
# Insert
# Insert will be tested through the following traversal:

# In-Order Traversal
# 5, 2, 8, 1, 3 -> 1, 2, 3, 5, 8
# 1, 2, 3, 4, 5 -> 1, 2, 3, 4, 5
# If the root input is None, return a tree with the only element being the new root node.
# You do not have to code the in-order traversal, it is part of the unit test.

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value)
      return
    end

    current = @root

    while true
      if value < current.value
        if current.left.nil?
          current.left = Node.new(value)
          break
        else
          current = current.left
        end
      elsif value > current.value
        if current.right.nil?
          current.right = Node.new(value)
          break
        else
          current = current.right
        end
      else
        # Value already exists, do nothing (or raise an exception if needed)
        break
      end
    end
  end

  def search(value)
    current = @root

    while current
      if value == current.value
        return current # Found the node
      elsif value < current.value
        current = current.left # Go left
      else # value > current.value
        current = current.right # Go right
      end
    end

    return nil # Value not found
  end

  def height(node)
    return 0 if node.nil? # Height of an empty tree is 0

    [height(node.left), height(node.right)].max + 1
  end

  def is_balanced?(node = @root)
    return true if node.nil? # An empty tree is balanced

    left_height = height(node.left)
    right_height = height(node.right)

    # Check if the height difference is at most 1 AND recursively check subtrees
    (left_height - right_height).abs <= 1 &&
      is_balanced?(node.left) &&
      is_balanced?(node.right)
  end

  def tree_height
    height(@root) # Calls the height method starting from the root
  end

  def print_tree(node = @root, level = 0)
    return if node.nil?

    print_tree(node.right, level + 1) # Print right subtree (indented)

    puts "  " * level + node.value.to_s # Print current node

    print_tree(node.left, level + 1)  # Print left subtree (indented)
  end
end

# Example Usage (for testing - in-order traversal is assumed to be handled by tests)
tree = BinarySearchTree.new

tree.insert(5)
tree.insert(2)
tree.insert(8)
tree.insert(1)
tree.insert(3)
tree.print_tree

# Example with a nil root
tree2 = BinarySearchTree.new
tree2.insert(1)
tree2.print_tree

puts tree2.root.value # Output: 1
# Example with sequential inserts
tree3 = BinarySearchTree.new
tree3.insert(1)
tree3.insert(2)
tree3.insert(3)
tree3.insert(4)
tree3.insert(5)
tree3.print_tree

# Example with duplicate inserts
tree4 = BinarySearchTree.new
tree4.insert(5)
tree4.insert(5) # This will not add another node.
tree4.print_tree
puts tree4.root.value # Output: 5
puts tree4.root.left.nil? # Output: true
puts tree4.root.right.nil? # Output: true

# Example Usage:
tree = BinarySearchTree.new
tree.insert(5)
tree.insert(2)
tree.insert(8)
tree.insert(1)
tree.insert(3)
tree.print_tree

found_node = tree.search(3)
if found_node
  puts "Found node with value: #{found_node.value}" # Output: Found node with value: 3
else
  puts "Value not found."
end

not_found_node = tree.search(7)
if not_found_node
    puts "Found node with value: #{not_found_node.value}"
else
    puts "Value not found." # Output: Value not found.
end

root_node = tree.search(5)
if root_node
    puts "Found root node with value: #{root_node.value}" # Output: Found root node with value: 5
end

empty_tree = BinarySearchTree.new()
empty_tree_search = empty_tree.search(5)
if empty_tree_search
    puts "Found node with value: #{empty_tree_search.value}"
else
    puts "Value not found." # Output: Value not found.
end

# Example Usage:
tree1 = BinarySearchTree.new
tree1.insert(5)
tree1.insert(2)
tree1.insert(8)
tree1.insert(1)
tree1.insert(3)
puts "Tree 1 is balanced: #{tree1.is_balanced?}" # Output: Tree 1 is balanced: true
tree1.print_tree
puts "Tree 1 height: #{tree1.tree_height}" # Output: Tree 1 height: 3

tree2 = BinarySearchTree.new
tree2.insert(1)
tree2.insert(2)
tree2.insert(3) # Unbalanced (right-skewed)
puts "Tree 2 is balanced: #{tree2.is_balanced?}" # Output: Tree 2 is balanced: false
tree2.print_tree
puts "Tree 2 height: #{tree2.tree_height}" # Output: Tree 2 height: 3

tree3 = BinarySearchTree.new
tree3.insert(3)
tree3.insert(2)
tree3.insert(1) # Unbalanced (left-skewed)
puts "Tree 3 is balanced: #{tree3.is_balanced?}" # Output: Tree 3 is balanced: false
tree3.print_tree
puts "Tree 3 height: #{tree3.tree_height}" # Output: Tree 3 height: 3

tree4 = BinarySearchTree.new
puts "Tree 4 is balanced: #{tree4.is_balanced?}" # Output: Tree 4 is balanced: true
tree4.print_tree
puts "Empty Tree height: #{tree4.tree_height}" # Output: Empty Tree height: 0

tree5 = BinarySearchTree.new
tree5.insert(1)
puts "Tree 5 is balanced: #{tree5.is_balanced?}" # Output: Tree 5 is balanced: true
tree5.print_tree
puts "Single Node Tree height: #{tree5.tree_height}" # Output: Single Node Tree height: 1

tree6 = BinarySearchTree.new
tree6.insert(5)
tree6.insert(3)
tree6.insert(7)
tree6.insert(2)
tree6.insert(4)
tree6.insert(6)
tree6.insert(8)
puts "Tree 6 is balanced: #{tree6.is_balanced?}" # Output: Tree 6 is balanced: true
tree6.print_tree
puts "Tree 6 height: #{tree6.tree_height}" # Output: Tree 6 height: 3

tree7 = BinarySearchTree.new
tree7.insert(5)
tree7.insert(3)
tree7.insert(7)
tree7.insert(2)
tree7.insert(4)
tree7.insert(6)
tree7.insert(8)
tree7.insert(9)
puts "Tree 7 is balanced: #{tree7.is_balanced?}" # Output: Tree 7 is balanced: false
tree7.print_tree
puts "Tree 7 height: #{tree7.tree_height}" # Output: Tree 7 height: 4
