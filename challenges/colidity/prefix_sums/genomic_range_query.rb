#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(s, p, q)
  impact_factors = {
    'A' => 1,
    'C' => 2,
    'G' => 3,
    'T' => 4
  }

  nucleotides = s.chars # string to array of characters

  prefix_sums = []
  prefix_sums << Hash.new(0)

  (1..nucleotides.length).each do |i|
    prefix_sums << prefix_sums[i - 1].clone
    prefix_sums[i][nucleotides[i - 1]] += 1
  end

  p prefix_sums

  num = p.size
  last = num - 1
  (0..last).map do |i|
    to_pos = q[i] + 1
    from_pos = p[i]

    if (prefix_sums[to_pos]['A'] - prefix_sums[from_pos]['A']).positive?
      impact_factors['A']
    elsif (prefix_sums[to_pos]['C'] - prefix_sums[from_pos]['C']).positive?
      impact_factors['C']
    elsif (prefix_sums[to_pos]['G'] - prefix_sums[from_pos]['G']).positive?
      impact_factors['G']
    elsif (prefix_sums[to_pos]['T'] - prefix_sums[from_pos]['T']).positive?
      impact_factors['T']
    end
  end
end

# This solution has time complexity O(n*m) - score 62%
def solution1(s, p, q)
  p '**This solution has time complexity O(n*m)**'
  nucleotides = {
    'A' => 1,
    'C' => 2,
    'G' => 3,
    'T' => 4
  }

  arr_s = s.chars # string to array of characters
  arr = arr_s.map { |char| nucleotides[char] }

  num = p.size
  last = num - 1
  (0..last).map do |i|
    arr[p[i]..q[i]].min
  end
end

# This solution has time complexity O(n+m) -> good one!
def solution2(s, p, q)
  n = s.length
  m = p.length
  impact_factors = {
    'A' => 1,
    'C' => 2,
    'G' => 3,
    'T' => 4
  }
  prefix_sums = Array.new(n + 1) { [0, 0, 0, 0] }
  result = Array.new(m)

  # compute prefix sums of impact factors
  for i in 1..n
    nucleotide = s[i - 1]
    impact_factor = impact_factors[nucleotide]
    prefix_sums[i] = prefix_sums[i - 1].clone
    prefix_sums[i][impact_factor - 1] += 1
  end

  p "prefix_sums"
  p prefix_sums

  # for each query, find the minimal impact factor in the corresponding range
  for i in 0..(m - 1)
    from = p[i]
    to = q[i]
    count_a = prefix_sums[to + 1][0] - prefix_sums[from][0]
    count_c = prefix_sums[to + 1][1] - prefix_sums[from][1]
    count_g = prefix_sums[to + 1][2] - prefix_sums[from][2]
    count_t = prefix_sums[to + 1][3] - prefix_sums[from][3]
    if count_a > 0
      result[i] = 1
    elsif count_c > 0
      result[i] = 2
    elsif count_g > 0
      result[i] = 3
    else
      result[i] = 4
    end
  end

  return result
end

def solution3(s, p, q)
  mapper = {
    "A" => 1,
    "C" => 2,
    "G" => 3,
    "T" => 4
  }

  arr = []
  s.each_char do |char|
    arr << mapper[char]
  end

  p "arr: #{arr}"

  m = p.length
  res = []
  for i in 0..(m - 1) do
    from = p[i]
    to = q[i]
    min = 100000
    (from..to).each do |item|
      min = arr[item] if arr[item] < min
    end
    res << min
  end

  res
end
# Analysis of solution3
# Detected time complexity:
# O(N * M)
# expand allExample tests
# ▶example
# example test✔OK
# expand allCorrectness tests
# ▶extreme_sinlge
# single character string✔OK
# ▶extreme_double
# double character string✔OK
# ▶simple
# simple tests✔OK
# ▶small_length_string
# small length simple string✔OK
# ▶small_random
# small random string, length = ~300✔OK
# expand allPerformance tests
# ▶almost_all_same_letters
# GGGGGG..??..GGGGGG..??..GGGGGG✘TIMEOUT ERROR
# Killed. Hard limit reached: 7.000 sec.
# ▶large_random
# large random string, length✘TIMEOUT ERROR
# Killed. Hard limit reached: 7.000 sec.
# ▶extreme_large
# all max ranges✘TIMEOUT ERROR
# Killed. Hard limit reached: 7.000 sec.

def solution4(s, p, q)
  p "----- solution4 -----"
  p "s: #{s}"
  p "p: #{p}"
  p "q: #{q}"

  n = s.length
  m = p.length

  # Initialize prefix sum arrays for each nucleotide
  a_sum = [0] * (n + 1)
  c_sum = [0] * (n + 1)
  g_sum = [0] * (n + 1)
  t_sum = [0] * (n + 1)
  # Calculate prefix sums
  s.each_char.with_index do |char, i|
    a_sum[i + 1] = a_sum[i]
    c_sum[i + 1] = c_sum[i]
    g_sum[i + 1] = g_sum[i]
    t_sum[i + 1] = t_sum[i]
    case char
    when 'A' then a_sum[i + 1] += 1
    when 'C' then c_sum[i + 1] += 1
    when 'G' then g_sum[i + 1] += 1
    when 'T' then t_sum[i + 1] += 1
    end
  end

  p "a_sum: #{a_sum}"
  p "c_sum: #{c_sum}"
  p "g_sum: #{g_sum}"
  p "t_sum: #{t_sum}"
  # Process queries
  result = []
  m.times do |i|
    from = p[i]
    to = q[i] + 1
    p "from: #{from} - to: #{to}"

    if a_sum[to] > a_sum[from]
      result << 1
    elsif c_sum[to] > c_sum[from]
      result << 2
    elsif g_sum[to] > g_sum[from]
      result << 3
    else
      result << 4
    end
  end

  result
end

list_args = [
  ['CAGCCTA', [2, 5, 0], [4, 5, 6]]
]

list_args.each do |args|
  # p "#0 - #{args}"
  # p 'Note: this solution is O(n*m), just use for reference'
  # p solution(*args)
  # p "#1 - #{args}"
  # p solution1(*args)
  # p "#2 - #{args}"
  # p solution2(*args)
  p "#3 - #{args}"
  p solution3(*args)
  p "#4 - #{args}"
  p solution4(*args)
end
