INPUT1 = <<~"EOS"
5
10
20
30
40
50
2
2 4 10
1 3 15
EOS

INPUT2 = <<~"EOS"
3
3
1
4
1
1 1 2
EOS

def been_throwing(people, beens, order)
  for i in (order[0] - 1)..(order[1] - 1) do
    if beens[i] + order[2] < people[i]
      beens[i] += order[2]
    else 
      beens[i] = people[i]
    end
  end
  return beens
end

def main(input)
  data = input.split("\n")
  count_1 = data.shift.to_i
  people = []
  count_1.times do
    people << data.shift.to_i
  end
  count_2 = data.shift.to_i
  orders = data.map {|order| order.split.map(&:to_i)}
  beens = Array.new(count_1, 0)
  orders.each do |order|
    beens = been_throwing(people, beens, order)
  end
  puts beens
end

main(INPUT1)