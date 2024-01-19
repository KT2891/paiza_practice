INPUT1 = <<~"EOS"
6
12
14
15
26
27
28
5
12
13
14
15
27
EOS

INPUT2 = <<~"EOS"
3
1
2
3
3
1
2
3
EOS

def scedule(result, live_a, live_b)
  flag = "A"
  live_a.each do |a|
    result[a - 1] = "A"
  end
  live_b.each do |b|
    if result[b - 1] == "A"
      if flag == "A"
        flag = "B"
      else
        result[b - 1] = "B"
        flag = "A"
      end
    else
      result[b - 1] = "B"
    end
  end
  return result
end

def solve(input)
  data = input.split("\n")
  count_a = data.shift.to_i
  live_a = []
  count_a.times do
    live_a << data.shift.to_i
  end
  count_b = data.shift.to_i
  live_b = []
  count_b.times do
    live_b << data.shift.to_i
  end

  result = Array.new(31, "x")

  result = scedule(result, live_a, live_b)

  puts result

end

solve(INPUT1)