INPUT1 = <<~EOS
4
y n
n y
n n
y y
EOS

def count(a, b)
  a == "y" && b == "y"
end

def show_result(probrems)
  probrems.each do |r|
    puts r
  end
end

def solve(input)
  input = input.split("\n")
  count = input.shift.to_i
  probrem_count = 0
  info = []
  count.times do 
    info << input.shift.split
  end

  probrems = []
  info.each_with_index do |row, i|
    unless count(row[0], row[1])
      probrem_count += 1
      probrems << i + 1
    end
  end

  puts probrem_count
  show_result(probrems)

end

solve(INPUT1)