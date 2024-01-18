INPUT1 = <<~"EOS"
4
apPle
error
suBway
Zb
EOS

INPUT2 = <<~"EOS"
5
idIOh
hiKoQA
AbijoD
djgeldi
kjoial
EOS

INPUT3 = <<~"EOS"
3
adijA
Akq
qZR
EOS

def solve(input)
  input = input.split("\n")
  count = input.shift.to_i
  data = []
  count.times do
    data << input.shift
  end

  flag = true
  for i in 0..count - 2 do
    last = data[i][-1]
    start = data[i + 1][0]
    if last == start
      flag = true
    else
      puts "#{last} #{start}"
      flag = false
      break
    end
  end

  if flag == true
    puts "Yes"
  end

end

solve(INPUT2)