#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Implement a trie with find, insert, remove, and list_words methods.
#
# Constraints
# Can we assume we are working with strings?
# Yes
# Are the strings in ASCII?
# Yes
# Should find only match exact words with a terminating character?
# Yes
# Should list_words only return words with a terminating character?
# Yes
# Can we assume this fits memory?
# Yes
# Test Cases

#          root
#        /  |  \
#       h   a*  m
#      / \   \   \
#     a   e*  t*  e*
#    / \         / \
#   s*  t*      n*  t*
#              /
#             s*

# find

# * Find on an empty trie
# * Find non-matching
# * Find matching

# insert

# * Insert on empty trie
# * Insert to make a leaf terminator char
# * Insert to extend an existing terminator char

# remove

# * Remove me
# * Remove mens
# * Remove a
# * Remove has

# list_words

# * List empty
# * List general case

class TrieNode
  attr_accessor :children, :is_word

  def initialize
    @children = {}
    @is_word = false
  end
end

class Trie
  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    current = @root
    word.each_char do |char|
      current.children[char] ||= TrieNode.new
      current = current.children[char]
    end
    current.is_word = true
  end

  def find(word)
    current = @root
    word.each_char do |char|
      return false unless current.children.key?(char)
      current = current.children[char]
    end
    current.is_word
  end

  def remove(word)
    remove_recursive(@root, word, 0)
  end

  def remove_recursive(node, word, index)
    return false if node.nil?

    if index == word.length
      if node.is_word
        node.is_word = false
        node.children.empty? # Return true if this node can be deleted
      else
        false # Word not found
      end
    else
      char = word[index]
      return false unless node.children.key?(char)

      should_delete_child = remove_recursive(node.children[char], word, index + 1)
      if should_delete_child
        node.children.delete(char)
        node.children.empty? && !node.is_word # Delete node if no other children and not a word
      else
        false
      end
    end
  end

  def list_words(node = @root, prefix = "", words = [])
    if node.is_word
      words << prefix
    end

    node.children.each do |char, child|
      list_words(child, prefix + char, words)
    end

    words
  end

  def visualize(node = @root, indent = "")
    output = ""

    node.children.each do |char, child|
      output += indent + "├── " + char + "\n"
      output += visualize(child, indent + "│   ")
    end

    if node.is_word
      output += indent + "└── (end of word)\n" if node.children.empty?
    end

    output
  end

  def print_trie
    puts "Trie Structure:\n"
    puts visualize
  end
end

# Test cases
trie = Trie.new

# Insert
trie.insert("has")
trie.insert("hat")
trie.insert("hate")
trie.insert("ham")
trie.insert("he")
trie.insert("hest")
trie.insert("mens")
trie.insert("me")
trie.insert("a")
trie.print_trie

# Find
puts "Find has: #{trie.find("has")}" # true
puts "Find hat: #{trie.find("hat")}" # true
puts "Find ham: #{trie.find("ham")}" # true
puts "Find ha: #{trie.find("ha")}" # false
puts "Find hasts: #{trie.find("hasts")}" # false
puts "Find a: #{trie.find("a")}" # true
puts "Find b: #{trie.find("b")}" # false

# Remove
trie.remove("me")
puts "Find me after remove: #{trie.find("me")}" # false
trie.remove("mens")
puts "Find mens after remove: #{trie.find("mens")}" # false
trie.remove("a")
puts "Find a after remove: #{trie.find("a")}" # false
trie.remove("has")
puts "Find has after remove: #{trie.find("has")}" # false

#List Words
trie = Trie.new
puts "List Empty: #{trie.list_words}" # []

trie.insert("has")
trie.insert("hat")
trie.insert("hate")
trie.insert("ham")
trie.insert("he")
trie.insert("hest")
trie.print_trie
puts "List General Case: #{trie.list_words}" # ["has", "hat", "hate", "ham", "he", "hest"]

# Example usage:
trie = Trie.new
trie.insert("cat")
trie.insert("car")
trie.insert("cab")
trie.insert("dog")
trie.insert("do")
trie.insert("done")

trie.print_trie

trie2 = Trie.new
trie2.insert("a")
trie2.insert("ab")
trie2.insert("abc")
trie2.insert("abcd")
trie2.print_trie

trie3 = Trie.new
trie3.insert("apple")
trie3.insert("application")
trie3.print_trie

trie4 = Trie.new
trie4.insert("has")
trie4.insert("hat")
trie4.insert("hate")
trie4.insert("ham")
trie4.insert("he")
trie4.insert("hest")
trie4.print_trie
