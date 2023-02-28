#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

require 'set'

def solution(connections, name1, name2)
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

  while !queue.empty?
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

def solution2(connections, name1, name2)
  return -1 if connections.empty?

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

args = [
  [['fred:joe', 'joe:mary', 'mary:fred', 'mary:bill'], 'fred', 'bill'],
  [['fred:joe', 'joe:mary', 'kate:sean', 'sean:sally'], 'fred', 'sally'],
  [['fred:joe', 'joe:sally'], 'fred', 'sally'],
  [['fred:joe', 'joe:sean', 'joe:mary', 'kate:sean', 'sean:sally'], 'fred', 'sally'],
]

args.each do |arg|
  p '-' * 20
  p "#1: #{solution(*arg)}"
  p "#2: #{solution2(*arg)}"
end
