INPUT1 = <<~"EOS"
5 1
2
7 2
1 4
EOS

INPUT2 = <<~"EOS"
7 3
4
7 1
7 4
5 3
10 1
EOS

def play(p_data, c_data)
  if p_data[0] < c_data[0]
    puts "Low"
  elsif p_data[0] > c_data[0]
    puts "High"
  elsif p_data[0] == c_data[0]
    if p_data[1] < c_data[1]
      puts "High"
    elsif p_data[1] > c_data[1]
      puts "Low"
    end
  end
end

def solve(input)
  data = input.split("\n")
  p_data = data.shift.split.map(&:to_i)
  count = data.shift.to_i
  c_data = []
  count.times do 
    c_data << data.shift.split.map(&:to_i)
  end
  c_data.each do |row|
    play(p_data, row)
  end

end

solve(INPUT2)