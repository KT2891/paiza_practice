INPUT1 = <<~"EOS"
8
3 5
EOS

INPUT2 = <<~"EOS"
10
2 4
EOS

INPUT3 = <<~"EOS"
200000
4 6
EOS

INPUT4 = <<~"EOS"
7
3 5
EOS

def count_unstepped_steps(total_steps, a, b)
  # 各段が踏まれるかどうかを記録する配列
  stepped = Array.new(total_steps + 1, false)
  # 確実に踏まれるスタートとゴールを設定
  stepped[0] = true
  stepped[-1] = true

  # 移動可能な段を探索するためのキュー
  queue = [0]

  # キューが空になるまで探索
  until queue.empty?
    current = queue.shift
    [a, b].each do |step|
      next_step = current + step
      if next_step <= total_steps && !stepped[next_step]
        stepped[next_step] = true
        queue.push(next_step)
      end
    end
  end

  # 踏まれない段の数をカウント
  stepped.count(false) # 0段目を除く
end

# 回答用フォーマット
def solve(input)
  input = input.split("\n")
  step = input.shift.to_i
  jump_a, jump_b = input.shift.split.map(&:to_i)

  puts count_unstepped_steps(step, jump_a, jump_b)
end

solve(INPUT3)