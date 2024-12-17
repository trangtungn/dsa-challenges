#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# We are going to print an organizational chart based on CSV input:
# employee_id,name,reports_to (employee_id)

# For example
# 1,Ben,0
# 2,Kate,1
# 3,Damien,2
# 4,Jane,1
# 5,Meng,4
# 6,Trang,2

# Produces the Chart as output
# Ben
#   Kate
#     Damien
#     Trang
#   Jane
#     Meng

# SAMPLE INPUT

# input = "1,Ben,0\n2,Kate,1\n3,Damien,2\n4,Jane,1\n5,Meng,4\n6,Trang,2"

# Solution 1: Using a hash to store the data and connections
# Step 1: Build the data hash
# {"1"=>{:name=>"Ben", :parent=>"0"}, "2"=>{:name=>"Kate", :parent=>"1"}, "3"=>{:name=>"Damien", :parent=>"2"}, "4"=>{:name=>"Jane", :parent=>"1"}, "5"=>{:name=>"Meng", :parent=>"4"}, "6"=>{:name=>"Trang", :parent=>"2"}}

# Step 2: Build the connections hash
# { "0" => ["1"], "1" => ["2", "4"], "2" => ["3", "6"], "4" => ["5"] }

# Step 3: Traverse the tree and print the values
# - Depth First Search (DFS) => not good, children are not under the correct parent
# - Recursive from root => OK

class TreeStructurePrinter
  def initialize(input_data)
    @data = build_data(input_data)
    @connections = build_connections
  end

  def print_connections
    root_node_id = @connections.first[1].first

    traverse_node(root_node_id)
  end

  private

  def traverse_node(node_id, indentation = '')
    print_value(@data[node_id][:name], indentation)

    return if @connections[node_id].nil?

    @connections[node_id].each do |child_node_id|
      traverse_node(child_node_id, indentation + '  ')
    end
  end

  def print_value(value, indentation = '')
    p "#{indentation}#{value}"
  end

  # REFACTOR: Use declarative approach to restructure the data
  # to a hash with key as id to optimize the lookup
  def build_data(input_data)
    hash = {}

    data_arr = input_data.split("\n")
    data_arr.each do |data|
      values = data.split(",")
      hash[values[0]] = {
        name: values[1],
        parent: values[2]
      }
    end

    hash
  end

  def build_connections
    conn = Hash.new { |hash, key| hash[key] = [] }

    @data.each do |key, obj|
      conn[obj[:parent]] << key
    end

    conn
  end
end

class Node
  attr_reader :id, :value, :child_nodes

  def initialize(id, value, child_nodes = [])
    @id = id
    @value = value
    @child_nodes = child_nodes
  end

  def add_child(node)
    @child_nodes << node
  end
end

class Tree
  def initialize(input_data)
    @root = nil
    @nodes = {}
    build_tree(input_data)
  end

  def add_root(node)
    @root = node
  end

  def build_tree(input_data)
    nodes = {}
    data_arr = input_data.split("\n")
    data_arr.each do |data|
      id, name, _ = data.split(",")
      nodes[id] = Node.new(id, name)
    end

    data_arr.each do |data|
      id, _, parent = data.split(",")
      if parent == "0"
        add_root(nodes[id])
      else
        nodes[parent].add_child(nodes[id])
      end
    end
  end

  def to_s
    print_tree(@root)
  end

  private

  def print_tree(node, link = '')
    p "#{link}#{node.value}"
    return if node.child_nodes.empty?

    node.child_nodes.each do |child|
      print_tree(child, link + '|-')
    end
  end
end

input = "1,Ben,0\n2,Kate,1\n3,Damien,2\n4,Jane,1\n5,Meng,4\n6,Trang,2"

p "--- Solution 1: "
TreeStructurePrinter.new(input).print_connections
p "--- Solution 2: "
Tree.new(input).to_s
