INPUT = <<~"EOS"
12345
9876
EOS

def check_buy(amount,money)
  if amount > money
    puts "Tarimasen!"
  else
    puts money - amount
  end
end

def solve(input)
  input = input.split("\n")
  amount = input.shift.to_i
  money = input.shift.to_i

  check_buy(amount,money)
end

solve(INPUT)