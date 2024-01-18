INPUT1 = <<~"EOS"
3
10
5
8
3
1 3 5
3 2 3
2 1 10
EOS

INPUT2 = <<~"EOS"
5
51
49
15
61
40
5
3 1 5
5 2 14
4 3 79
3 5 31
4 3 51
EOS

def pass(data, a, b, x)
  x = [data[a -1], x].min 
  data[a - 1] -= x
  data[b - 1] += x
  return data
end

def solve(input)
  data = input.split("\n")
  p_count = data.shift.to_i
  p_data = []
  p_count.times do
    p_data << data.shift.to_i
  end
  m_count = data.shift.to_i

  m_data = []
  m_count.times do
    m_data << data.shift.split.map(&:to_i)
  end

  m_data.each do |row|
    p_data = pass(p_data, row[0], row[1], row[2])
  end

  pp p_data

end

solve(INPUT2)