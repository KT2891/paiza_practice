INPUT1 = <<~"EOS"
5 1
2 2
1 3
6 1
6 3
7 4
EOS

INPUT2 = <<~"EOS"
3 3
1 2
4 2
4 5
EOS


# 回答用フォーマット
def solve(input)
  input = input.split("\n")
  count, radius = input.shift.split.map(&:to_i)
  map_info = []
  count.times do
    data = input.shift.split.map(&:to_i)
    map_info << data
  end

  pp count
  pp radius
  pp map_info
end

solve(INPUT1)