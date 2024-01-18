INPUT1 = <<~"EOS"
98 75
EOS

INPUT2 = <<~"EOS"
274 840
EOS

INPUT3 = <<~"EOS"
624 58
EOS

def solve(input)
  a, b = input.split.map(&:to_i).map(&:digits)
  max_length = [a.length, b.length].max
  score = Array.new(max_length) do |i|
    (a[i] || 0) + (b[i] || 0)
  end

  puts score.map { |n| n % 10 }.reverse.join
end

solve(INPUT2)