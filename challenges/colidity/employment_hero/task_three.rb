#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Solution 3: using BFS. PASSED ALL TESTS
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

# Solution 4: using DFS. passed all tests ***BUT NOT THE SHORTEST PATH***
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
  p "======= Case: #{arg}"
  p "#3 - BFS: #{solution3(*arg)}"
  p "#4 - DFS: #{solution4(*arg)}"
end
