#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

# Problem:
# Implement a hash table with set, get, and remove methods.
# For simplicity, are the keys integers only?
# Yes
# For collision resolution, can we use chaining?
# Yes
# Do we have to worry about load factors?
# No
# Do we have to validate inputs?
# No
# Can we assume this fits memory?
# Yes
#
# Test Cases
# get no matching key -> KeyError exception
# get matching key -> value
# set no matching key -> new key, value
# set matching key -> update value
# remove no matching key -> KeyError exception
# remove matching key -> remove key, value
# Solution:
# https://nbviewer.org/github/donnemartin/interactive-coding-challenges/blob/master/arrays_strings/hash_map/hash_map_solution.ipynb
def solution(str)
end

args = [
]

args.each do |arg|
  p '---'
  p "--- solution(#{arg}) = #{solution(arg)}"
end
