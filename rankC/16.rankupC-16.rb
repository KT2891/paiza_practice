INPUT1 = <<~"EOS"
--PA-I---ZA
EOS

INPUT2 = <<~"EOS"
------2000--------01---01--Fizz----Buzz---
EOS

# 連続するハイフンを単一のハイフンに置換
def main(input)
  data = input.gsub(/-+/, "-")
  puts data
end

main(INPUT2)
