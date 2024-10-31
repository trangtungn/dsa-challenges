#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

def solution(n)

end

# Claude AI solution
def solution2(a)
  # Find all peaks
  peaks = []
  (1..a.length-2).each do |i|
      if a[i-1] < a[i] && a[i] > a[i+1]
          peaks << i
      end
  end

  return 0 if peaks.empty?

  # Try different numbers of flags
  max_flags = Math.sqrt(a.length).to_i + 1
  max_result = 1

  (2..max_flags).each do |flags|
      pos = peaks[0]
      flags_used = 1
      peaks_idx = 1

      # Try to place remaining flags
      while peaks_idx < peaks.length && flags_used < flags
          if peaks[peaks_idx] - pos >= flags
              pos = peaks[peaks_idx]
              flags_used += 1
          end
          peaks_idx += 1
      end

      max_result = [max_result, flags_used].max
      break if flags_used < flags  # If we couldn't place all flags, no need to try more
  end

  max_result
end

args = [
  [5, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2],
  [1, 5, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2]
]

args.each do |arg|
  p '----'
  # p "#1 - #{arg}"
  # p solution(arg)
  p "#2 - Claude AI: counting divisors #{arg}"
  p solution2(arg)
end
