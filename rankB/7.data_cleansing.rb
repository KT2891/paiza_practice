INPUT = <<~"EOS"
5 3
80 -50 30
0090 50 xxx
120 40 50
40 90 90
50 1 80
EOS

def solve(input)
  data = input.split("\n")
  people, que_num = data.shift.split.map(&:to_i)
  answers = Array.new(que_num){ Array.new(people, nil) }
  for i in 0..people - 1 do
    answer = data.shift.split.map{ |item| item.to_i if item =~ /^[0-9]+$/ }
    for j in 0..que_num - 1 do
      if answer[j] != nil && answer[j] <= 100 
        answers[j][i] = answer[j]
      end
    end
  end

  ans_ave = []
  answers.each do |answer|
    answer.compact!
    if answer.empty?
      ans_ave << 0
    else
      ave = answer.sum / answer.length
      ans_ave << ave
    end
  end

  puts ans_ave

end

solve(INPUT)