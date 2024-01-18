INPUT1 = <<~"EOS"
30
EOS

INPUT2 = <<~"EOS"
67
EOS

def solve(input)
  data = input.to_i
  data = data + 10

  puts data
end

solve(INPUT2)