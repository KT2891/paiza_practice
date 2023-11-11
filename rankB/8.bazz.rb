INPUT = <<~"EOS"
2 5 3 1000
100 100
500 200
60 300
100 500
10 1000
EOS

def solve(input)
  data = input.split("\n")
  count, time, period, action_count = data.shift.split.map(&:to_i)
  datas = Array.new(time){Array.new(count, 0)}

end

solve(INPUT)