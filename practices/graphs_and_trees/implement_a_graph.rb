#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Implement a graph.
#
# Constraints
# Is the graph directed?
# Implement both
# Do the edges have weights?
# Yes
# Can the graph have cycles?
# Yes
# If we try to add a node that already exists, do we just do nothing?
# Yes
# If we try to delete a node that doesn't exist, do we just do nothing?
# Yes
# Can we assume this is a connected graph?
# Yes
# Can we assume the inputs are valid?
# Yes
# Can we assume this fits memory?
# Yes
# Test Cases
# Input:

# add_edge(source, destination, weight)
# graph.add_edge(0, 1, 5)
# graph.add_edge(0, 5, 2)
# graph.add_edge(1, 2, 3)
# graph.add_edge(2, 3, 4)
# graph.add_edge(3, 4, 5)
# graph.add_edge(3, 5, 6)
# graph.add_edge(4, 0, 7)
# graph.add_edge(5, 4, 8)
# graph.add_edge(5, 2, 9)
# Result:

# source and destination nodes within graph are connected with specified weight.
# Note:

# The Graph class will be used as a building block for more complex graph challenges.

class Graph
  def initialize
    @adj = {}
  end

  def add_edge(source, destination, weight)
    @adj[source] ||= {}
    @adj[destination] ||= {} # Ensure destination exists as a node

    @adj[source][destination] = weight
  end

  def remove_edge(source, destination)
    return unless @adj.key?(source) && @adj[source].key?(destination)

    @adj[source].delete(destination)
  end

  def remove_node(node)
    return unless @adj.key?(node)

    @adj.delete(node)

    #Remove all edges pointing to node
    @adj.each do |source, neighbors|
        neighbors.delete(node) if neighbors.key?(node)
    end
  end

  def neighbors(node)
    @adj[node] || {}
  end

  def has_node?(node)
    @adj.key?(node)
  end

  def has_edge?(source, destination)
    @adj.key?(source) && @adj[source].key?(destination)
  end

  def get_weight(source, destination)
    return nil unless has_edge?(source, destination)
    @adj[source][destination]
  end

  def to_s
    output = ""
    @adj.each do |node, neighbors|
      output += "#{node}: "
      neighbors.each do |neighbor, weight|
        output += "(#{neighbor}, #{weight}) "
      end
      output += "\n"
    end
    output
  end

  def print_graph(indent = 0)
    @adj.sort.each do |node, neighbors| # Sort nodes for consistent output
      puts "#{'  ' * indent}#{node}:"
      neighbors.sort.each do |neighbor, weight| # Sort neighbors for consistent output
        puts "#{'  ' * (indent + 1)}- #{neighbor} (Weight: #{weight})"
      end
      puts if !neighbors.empty? # Add newline after neighbors if any
    end
  end
end

# Test Cases
graph = Graph.new
graph.add_edge(0, 1, 5)
graph.add_edge(0, 5, 2)
graph.add_edge(1, 2, 3)
graph.add_edge(2, 3, 4)
graph.add_edge(3, 4, 5)
graph.add_edge(3, 5, 6)
graph.add_edge(4, 0, 7)
graph.add_edge(5, 4, 8)
graph.add_edge(5, 2, 9)

puts graph.to_s
# graph.print_graph

graph.remove_edge(0,1)
puts "After removing edge 0->1:"
puts graph.to_s

graph.remove_node(5)
puts "After removing node 5:"
puts graph.to_s

puts "Does node 0 have neighbor 1? #{graph.has_edge?(0,1)}"
puts "Does node 0 have neighbor 5? #{graph.has_edge?(0,5)}"
puts "Weight from 2 to 3: #{graph.get_weight(2,3)}"
puts "Weight from 0 to 1: #{graph.get_weight(0,1)}"

p '--------------------------------'
# Test Cases
graph = Graph.new
graph.add_edge(0, 1, 5)
graph.add_edge(0, 5, 2)
graph.add_edge(1, 2, 3)
graph.add_edge(2, 3, 4)
graph.add_edge(3, 4, 5)
graph.add_edge(3, 5, 6)
graph.add_edge(4, 0, 7)
graph.add_edge(5, 4, 8)
graph.add_edge(5, 2, 9)

puts "Graph:"
graph.print_graph

graph.remove_edge(0,1)
puts "\nAfter removing edge 0->1:"
graph.print_graph

graph.remove_node(5)
puts "\nAfter removing node 5:"
graph.print_graph

graph2 = Graph.new
graph2.add_edge(2,1,1)
graph2.add_edge(1,0,1)
puts "\nGraph2:"
graph2.print_graph
