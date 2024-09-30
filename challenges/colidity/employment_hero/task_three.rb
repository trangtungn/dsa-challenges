#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require 'set'

def solution(connections, name1, name2)
  return 0 if name1 == name2
  return -1 if connections.empty?
  graph = Hash.new { |h, k| h[k] = [] }

  # Build the graph
  connections.each do |connection|
    name_a, name_b = connection.split(":")
    graph[name_a] << name_b
    graph[name_b] << name_a
  end

  # Perform a breadth-first search to find the shortest path between the two names
  queue = [[name1, 0]]
  visited = Set.new([name1])

  until queue.empty?
    name, distance = queue.shift
    return distance if name == name2

    graph[name].each do |friend|
      next if visited.include?(friend)

      visited << friend
      queue << [friend, distance + 1]
    end
  end

  # If we've searched the entire graph and haven't found a path to the target name, return -1
  -1
end

# Solution 2: using hash. failed test case 4, 5, 6, 8 (index 3).
def solution2(connections, name1, name2)
  return -1 if connections.empty?
  return 0 if name1 == name2

  if connections.size == 1
    return 0 if connections.first.include?(name1) && connections.first.include?(name2)

    -1
  end

  con_mapper = {}
  connections.each do |con|
    head, tail = con.split(':')

    con_mapper[head] = tail
  end

  count = 0
  match = false
  first = name1
  while con_mapper.any?
    last = con_mapper.delete(first)
    return -1 if last.nil? || last.empty?

    count += 1

    if con_mapper[last] == name2
      match = true
      break
    end

    first = last
  end

  return count if match == true

  -1
end

# Solution 3: using BFS. passed all tests
# Breadth First Search or BFS for a Graph: https://www.geeksforgeeks.org/breadth-first-search-or-bfs-for-a-graph/#applications-of-bfs-in-graphs
def solution3(connections, head, tail)
  return -1 if connections.empty?
  return 0 if head == tail

  mapper = {}
  connections.each do |connection|
    name1, name2 = connection.split(':')
    mapper[name1] = [] unless mapper[name1]
    mapper[name1] << name2
  end

  p mapper

  queue = [head]
  visited = { head => true }
  count = -1
  reached = false
  until queue.empty?
    item = queue.shift
    next if !mapper[item]

    mapper[item].each do |next_item|
      next if visited[next_item]

      if next_item == tail
        reached = true
        break
      end

      visited[next_item] = true
      queue << next_item
    end

    count += 1
  end

  reached ? count : -1
end

# Solution 4: using DFS. passed all tests.
# Depth First Search or DFS for a Graph: https://www.geeksforgeeks.org/depth-first-search-or-dfs-for-a-graph/
def solution4(connections, head, tail)
  return -1 if connections.empty?
  return 0 if head == tail

  mapper = {}
  connections.each do |connection|
    from, to = connection.split(':')
    mapper[from] = [] unless mapper[from]
    mapper[from] << to
  end

  p "mapper"
  p mapper

  stack = [head]
  visited = { head => -1 }
  while stack.any?
    # p "stack"
    # p stack
    item = stack.pop
    next_items = mapper[item]
    next if !next_items

    next_items.each do |next_item|
      return visited[item] + 1 if next_item == tail
      next if visited[next_item]

      stack << next_item
      visited[next_item] = visited[item] + 1
    end
  end

  -1
end

args = [
  [['fred:joe', 'joe:mary', 'mary:fred', 'mary:bill'], 'fred', 'bill'],
  [['fred:joe', 'joe:mary', 'kate:sean', 'sean:sally'], 'fred', 'sally'],
  [['fred:joe', 'joe:sally'], 'fred', 'sally'],
  [['fred:joe', 'joe:sean', 'joe:mary', 'kate:sean', 'sean:sally'], 'fred', 'sally'],
  [['fred:joe', 'joe:mary', 'kate:sean', 'sean:sally', 'mary:bob', 'bob:sean', 'bob:bill'], 'fred', 'sally'],
  [['fred:joe', 'joe:mary', 'mary:fred', 'mary:bill'], 'mary', 'fred'],
  [['fred:joe', 'joe:mary', 'mary:fred', 'mary:mary'], 'mary', 'mary'],
  [['fred:joe', 'joe:mary', 'mary:fred', 'mary:mary', 'kate:sean', 'sean:sally', 'mary:bob', 'bob:sean', 'bob:bill'], 'fred', 'sally'],
  [[], 'fred', 'sally'],
  [['fredsally:billy', 'billy:sally'], 'fred', 'billy']
]

args.each do |arg|
  p "=" * 20
  p "case: #{arg}"
  p "#1: #{solution(*arg)}"
  p "#2: #{solution2(*arg)}"
  p "#3: #{solution3(*arg)}"
  p "#4: #{solution4(*arg)}"
end
