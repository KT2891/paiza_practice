INPUT1 = <<~"EOS"
ALANTURING
EOS

def change(data, s, i)
  case s
  when "A"
    data[i] = 4
  when "E"
    data[i] = 3
  when "G"
    data[i] = 6
  when "I"
    data[i] = 1
  when "O"
    data[i] = 0
  when "S"
    data[i] = 5
  when "Z"
    data[i] = 2
  end
end

def solve(input)
  data = input.split("")
  data.each_with_index do |s, i|
    change(data, s, i)
  end
  data.delete("\n")
  pp data.join
end

solve(INPUT1)