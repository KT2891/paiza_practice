INPUT1 = <<~"EOS"
hamburg
2
cheese hamburg
EOS

INPUT2 = <<~"EOS"
apple
4
spicy pizza with pineapple
EOS

def solve(input)
  data = input.split("\n")
  target = data.shift.to_s
  count = data.shift.to_i
  menus = data.shift.split.map(&:to_s)

  if menus.include?(target)
    printf("YES")
  else
    printf("No")
  end
end

solve(INPUT2)