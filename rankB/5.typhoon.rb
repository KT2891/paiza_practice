INPUT =<<~"EOS"
3 50
40 40 40
40 40 40
40 40 40
EOS

def solve(input)
  data = input.split("\n")
  route_count, threshold = data.shift.split.map(&:to_i) #道の数としきい値の抽出
  routes = [] 
  route_count.times do
    route = data.shift.split.map(&:to_i)
    routes << route #道の情報を配列に格納
  end

  clear_route = Array.new(route_count, true) #ルートが通れるかどうかのフラグ
  routes.each do |route|
    for i in 0..route_count - 1 do
      if route[i] >= threshold #ルートがしきい値を超えていたらfalseに変更
        clear_route[i] = false
      end
    end
  end
  result = []
  clear_route.each_with_index do |item, i|
    if item == true
      result << i + 1
    end
  end

  if clear_route.include?(true)
    puts result.join(" ")
  else
    puts "wait"
  end

end

solve(INPUT)