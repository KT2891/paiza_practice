INPUT1 = <<~"EOS"
5
sato
suzuki
takahashi
suzuki
suzuki
EOS

INPUT2 = <<~"EOS"
2
paiza
paiza
EOS

def solve(input)
  data = input.split("\n")
  count = data.shift.to_i
  info = []
  count.times do
    info << data.shift
  end

  puts info.max_by{ |element| info.count(element)}

end

solve(INPUT1)