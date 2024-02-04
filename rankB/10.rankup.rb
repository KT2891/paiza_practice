INPUT1 = <<~"EOS"
5 3
1 2
3 4
5 3
EOS

INPUT2 = <<~"EOS"
4 2
1 2
3 4
EOS

def judge(trains, a, b)
  trains[a] += trains[b]
  trains[b] = 0
  return trains
end

def winner_print(trains)
  win_count = trains.max
  trains.each_with_index do |train, i|
    puts i + 1 if train == win_count
  end
end

def solve(input)
  # データ処理
  data = input.split("\n")
  people, count = data.shift.split.map(&:to_i)
  fight = []
  fight = data.map { |match| match.split.map(&:to_i)}

  # 勝敗について判定
  trains = Array.new(people, 1)
  fight.each do |a, b|
    trains = judge(trains, a - 1, b - 1)
  end

  winner_print(trains)
end

solve(INPUT2)