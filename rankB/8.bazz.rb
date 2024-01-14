# 入力テスト
input = <<~EOS
  4 4 4 12
  1 1 1 1
  1 2 3 4
  1 3 6 10
  1 4 10 20
EOS

def solve(input)
  data = input.split("\n")
  count, time, period, action_count = data.shift.split.map(&:to_i)

  # 行動データを2次元配列に変換
  actions = data.map { |line| line.split.map(&:to_i) }.transpose

  answers = actions.map do |action|
    # 各行動の期間内の合計を計算
    total_actions = action.each_cons(period).map(&:sum)

    # 条件を満たす最初のインデックスを探す
    index = total_actions.find_index { |sum| sum >= action_count }
    # 結果を設定
    if index
      ["yes", index + period]
    else
      ["no", nil]
    end
  end

  # 結果を出力
  answers.each { |result, index| puts "#{result} #{index}" }
end

solve(input)