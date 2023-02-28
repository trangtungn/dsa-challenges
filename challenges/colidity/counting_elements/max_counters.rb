#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(n, a)
  counters = Array.new(n, 0)

  maximized = false
  max_counter = 0
  a.each do |val|
    if val >= 1 && val <= n
      maximized = false

      counters[val - 1] += 1
      max_counter = counters[val - 1] if max_counter < counters[val - 1]
    elsif val == n + 1
      counters = Array.new(n, max_counter) unless maximized
      maximized = true
    end
  end

  counters
end

def solution2(n, a)
  counters = Array.new(n, 0)
  max_counter = 0
  min_counter = 0

  a.each do |val|
    if val >= 1 && val <= n
      counters[val - 1] = [counters[val - 1], min_counter].max + 1
      max_counter = [max_counter, counters[val - 1]].max
    elsif val == n + 1
      min_counter = max_counter
    end
    p counters
    p '-'
  end

  counters.map { |count| [count, min_counter].max }
end

p solution(5, [3, 4, 4, 6, 1, 4, 4])
p solution2(5, [3, 4, 4, 6, 1, 4, 4])
p '---'

p solution(5, [3, 6, 4, 6, 1, 4])
p solution2(5, [3, 6, 4, 6, 1, 4])
