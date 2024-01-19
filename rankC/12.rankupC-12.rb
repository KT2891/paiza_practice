INPUT1 = <<~"EOS"
3
3
1
4
EOS

INPUT2 = <<~"EOS"
8
17
28
11
62
64
4
7
17
EOS

def move(now, total_move, move_data)
  total_move += (now - move_data).abs
  return move_data, total_move
end

def solve(input)
  data = input.split("\n")
  count = data.shift.to_i
  move_data = []
  count.times do
    move_data << data.shift.to_i
  end
  now = 1
  total_move = 0

  move_data.each do |element|
    now, total_move = move(now, total_move, element)
  end

  puts total_move

end

solve(INPUT2)