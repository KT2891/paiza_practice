INPUT = <<~"EOS"
10
cgmboyhyyv
hlrgtdwdda
EOS

ALPHABET = [*"a".."z"]

def check_cryptography(base,crypto,length)

  base_index = []
  crypto_index =[]
  # アルファベットの位置を取得
  base.each do |x|
    base_index << ALPHABET.index(x)
  end
  crypto.each do |y|
    crypto_index << ALPHABET.index(y)
  end

  #最初の文字からズレている量を確認
  rot_num = base_index[0] - crypto_index[0]
  fixed_count = 0

  # 間違っている数を数える。
  for i in 0..length - 1 do
    if base_index[i] - crypto_index[i] == rot_num || base_index[i] - crypto_index[i] == rot_num + 26
    else
      fixed_count += 1
    end
  end

  # rot_numがzからaに移動していた場合の調整

  case fixed_count
  when 0 then #間違いがなかった場合
    puts "correct rot-#{rot_num.abs}"
  when 1 then #間違いが1つだった場合
    puts "fixed " + base.join.to_s
  else #間違いが2つ以上だった場合
    puts "incorrect"
  end
end

def solve(input)
  input = input.split("\n")
  length = input.shift.to_i
  base = input.shift.split("")
  crypto = input.shift.split("")

  check_cryptography(base, crypto,length)
end

solve(INPUT)