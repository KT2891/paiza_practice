INPUT1 = <<~"EOS"
2000 5
300
500
300
100
100
EOS

INPUT2 = <<~"EOS"
3000 3
1000
1000
1000
EOS

def ride(default, pay_data, point)
  if pay_data <= point
    point -= pay_data
  else
    point += pay_data / 10
    default -= pay_data
  end
  return default, point
end

def solve(input)
  data = input.split("\n")
  default, count = data.shift.split.map(&:to_i)
  point = 0
  count.times do
    pay_data = data.shift.to_i
    default, point = ride(default, pay_data, point)
    puts "#{default} #{point}"
  end

end

solve(INPUT2)