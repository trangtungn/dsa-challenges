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

end
