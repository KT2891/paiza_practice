INPUT = <<~"EOS"
20
1
5
3
5
8
4
1
5
8
4
5
5
5
5
5
4
1
2
5
8
4
EOS

def solve(input)
  data = input.split("\n").map(&:to_i)
  count = data.shift
  data = data.uniq
  miss_count = 0
  for i in 1..count do
    unless data.include?(i)
      miss_count += 1
    end
  end
  puts miss_count
end
solve(INPUT)