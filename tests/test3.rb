#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# TODO:
# Write a function that receives an array of strings that represent friend connections along with the names of two people and retums a number representing the degrees of separation between the two people.
# The connections will be represented by an array of strings with each string taking the format namelsname2 for examples alice:bob. You can assume that the strings representing the connections will always be lower case a-z only.
# The names of the people to find the degrees of separation between will always be non-empty strings e.g. "alice" or "bob".
# Your function will return the number of degrees of separation between the two people. If no connection can be made through friends or friends of friends etc then return -1.

# Example 1

#   ```
#   connections = ["fred:joe", "joe:mary", "mary:fred", "mary:bill"]
#   namel = "fred"
#   name2 = "bill"
#   ```
#   Result = 2
#   The expected result is 2 because fred is friends with mary, and mary is friends with bill. That is, bill is of distance 2 from fred.
#   Test Output
#     fred > mary > bill (fred -> mary = 1, mary -> bill = 2)

# Example 2
#  ```
#  connections= ["fred:joe", "joe:mary", "kate:sean", "sean:sally"]
#  namel = "fred"
#  name2 = "sally"
#  ```
#
# Result -1
# The expected result is -1 because there are no connections that link fred to sally through either his friends or friends of friends etc.

# Solution A: failed test 3, return -1 instead of 4
def solution_a(connections, head, tail)
  return -1 if connections.empty?

  mapper = {}
  connections.each do |connection|
    return 0 if connection.include?(head) && connection.include?(tail)

    name1, name2 = connection.split(':')
    mapper[name1] = name2
  end

  p mapper

  item = head
  reached = false
  vals = []
  loop do
    next_item = mapper[item]
    break if next_item.nil?

    vals << next_item

    if next_item == tail
      reached = true
      break
    end

    p "next_item: #{next_item}"

    item = next_item
  end

  return -1 if vals.empty? || !reached

  vals.size - 1
end

# Solution B: using BFS. failed test 3, return 5 instead of 4
# Breadth First Search or BFS for a Graph: https://www.geeksforgeeks.org/breadth-first-search-or-bfs-for-a-graph/#applications-of-bfs-in-graphs
def solution_b(connections, name1, name2)
  return 0 if name1 == name2

  graph = Hash.new { |hash, key| hash[key] = [] }

  connections.each do |connection|
    person1, person2 = connection.split(':')
    graph[person1] << person2
    graph[person2] << person1
  end

  queue = [[name1, 0]]
  visited = { name1 => true }

  until queue.empty?
    current_person, degree = queue.shift

    graph[current_person].each do |friend|
      next if visited[friend]

      return degree + 1 if friend == name2

      visited[friend] = true
      queue << [friend, degree + 1]
    end
  end

  -1
end

# Solution C: using BFS. passed all tests
# Breadth First Search or BFS for a Graph: https://www.geeksforgeeks.org/breadth-first-search-or-bfs-for-a-graph/#applications-of-bfs-in-graphs
def solution_c(connections, head, tail)
  return -1 if connections.empty?

  mapper = {}
  connections.each do |connection|
    return 0 if connection.include?(head) && connection.include?(tail)

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

# Solution D: using BFS. fix for solution B, pass all tests
# Breadth First Search or BFS for a Graph: https://www.geeksforgeeks.org/breadth-first-search-or-bfs-for-a-graph/#applications-of-bfs-in-graphs
def solution_d(connections, head, tail)
  return 0 if head == tail
  return -1 if connections.empty?

  # Build the graph
  graph = Hash.new { |h, k| h[k] = [] }
  connections.each do |connection|
    name1, name2 = connection.split(':')
    graph[name1] << name2
    # graph[name2] << name1  # Make the graph undirected
  end

  # BFS
  queue = [[head, 0]]  # [node, distance]
  visited = { head => true }
  count = -1

  while !queue.empty?
    current, distance = queue.shift

    count += 1 if graph[current].any?

    graph[current].each do |neighbor|
      return count if neighbor == tail

      next if visited[neighbor]

      visited[neighbor] = true
      queue << [neighbor, distance + 1]
    end
  end

  -1  # No path found
end

# Solution E: using DFS.
# Depth First Search or DFS for a Graph: https://www.geeksforgeeks.org/depth-first-search-or-dfs-for-a-graph/
def solution_e(connections, head, tail)
  return -1 if connections.empty?

  mapper = {}
  connections.each do |connection|
    return 0 if connection.include?(head) && connection.include?(tail)

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

def solution(connections, head, tail)
  solution_e(connections, head, tail)
end

# Test 1
connections = ['fred:joe', 'joe:mary', 'mary:fred', 'mary:bill']
name1 = 'fred'
name2 = 'bill'

puts "test 1: #{solution(connections, name1, name2)}" # 2

# Test 2
connections = ['fred:joe', 'joe:mary', 'kate:sean', 'sean:sally']
name1 = 'fred'
name2 = 'sally'

puts "test 2: #{solution(connections, name1, name2)}" # -1

# Test 3
connections = ['fred:joe', 'joe:mary', 'kate:sean', 'sean:sally', 'mary:bob', 'bob:sean', 'bob:bill']
name1 = 'fred'
name2 = 'sally'

puts "test 3: #{solution(connections, name1, name2)}" # 4

# Test 4
connections = ['fred:joe', 'joe:mary', 'mary:fred', 'mary:bill']
name1 = 'mary'
name2 = 'fred'

puts "test 4: #{solution(connections, name1, name2)}" # 0

# Test 5
connections = ['fred:joe', 'joe:mary', 'mary:fred', 'mary:mary']
name1 = 'mary'
name2 = 'mary'

puts "test 5: #{solution(connections, name1, name2)}" # 0

# Test 6
connections = ['fred:joe', 'joe:mary', 'mary:fred', 'mary:mary', 'kate:sean', 'sean:sally', 'mary:bob', 'bob:sean', 'bob:bill']
name1 = 'fred'
name2 = 'sally'

puts "test 6: #{solution(connections, name1, name2)}" # 4

# Test 7
connections = []
name1 = 'fred'
name2 = 'sally'

puts "test 7: #{solution(connections, name1, name2)}" # -1
