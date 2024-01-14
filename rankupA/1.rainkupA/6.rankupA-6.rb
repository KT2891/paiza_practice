# あなたはあるパズルで遊んでいます。
# このパズルは以下のような H 行 5 列のセルからなる盤面上で行われます。
# 各セルには "1" から "9" までの数字が刻まれたブロックが置かれています。

# これらのブロックは、自身の上下左右に隣接する盤面内のセルすべてにブロックがあり、かつそれらすべてに同じ数字が刻まれている場合に、隣接するブロックと一緒に消去されます。
# また、この様なブロックが複数同時に存在する場合、関連するブロックすべてが同時に消去されます。

# さらに各ブロックは、自身の下にブロックが存在しない場合、他のブロックの上または盤面の一番下に到達するまで落下します。

# あなたが知りたいのは、ブロックの消去と落下を可能な限り繰り返した後での盤面の様子です。
# それを出力するプログラムを作成してください。

# 評価ポイント
# 10個のテストケースを入力し、正答数と解答の提出までに要した時間を測定し得点が決まります。
# ※提出いただいたコードは複数回実行され、一度の実行では1つのテストケースのみ入力
# ※制限時間を超えるとテストケースが通っても失格(0点)となります。
# 得点の計算方法：正解数得点(50点) ＋ 正解率×解答時間得点(2時間以内で50点、4時間以内で25点、6時間で0点と線形に点数が落ちます)
# 10個のテストケースで正しい出力がされるか評価 (50点)
# 解答の提出までに要した時間による評価 (50点)
# 入力される値
# 入力は次のフォーマットで与えられます。
# H
# S_1
# ...
# S_H

# ・1 行目には、盤面の行数を表す整数 H が与えられます。
# ・続く H 行のうち 1 + i 行目 (1 ≦ i ≦ H) には、盤面の i 行目の情報を表す長さ 5 の文字列 S_i が与えられます。
# 　・S_i の j (1 ≦ j ≦ 5) 文字目は盤面の i 行 j 列目を表し、 "." ならばブロックがないことを、"1" から "9" の数字文字の場合はその数字が刻まれたブロックが存在することを表します。
# ・入力は合計で H + 1 行となり、入力値最終行の末尾に改行が 1 つ入ります。

# 文字列は標準入力から渡されます。標準入力からの値取得方法はこちらをご確認ください
# 期待する出力
# ブロックの消去と落下を可能な限り繰り返した後の盤面の様子を出力してください。

# 末尾に改行を入れ、余計な文字、空行を含んではいけません。
# 条件
# すべてのテストケースにおいて、以下の条件をみたします。
# ・2 ≦ H ≦ 10
# ・(S_i の長さ) = 5 (1 ≦ i ≦ H)
# ・S_i は記号 "." または "1" から "9" の数字文字のみからなる (1 ≦ i ≦ H)
# ・入力される盤面には落下するブロックは存在しない

INPUT1 = <<~"EOS"
5
.214.
1321.
33311
13214
33324
EOS

INPUT2 = <<~"EOS"
4
51533
11131
21343
22444
EOS

# 盤面を作成
class Map
  def initialize(info)
    @map_info = info
    @lows = @map_info.length
    @cols = @map_info[0].length
    @del_check = Array.new(@lows) { Array.new(@cols,false)}
  end

  def reset_del_check
    @del_check.each do |row|
      row.map! { false }
    end
  end

  # @del_checkを参照にして対象の数値を削除
  def delete_closs
    for i in 0..@lows - 1 do
      for j in 0..@cols - 1 do
        if @del_check[i][j] == true
          @map_info[i][j] = 0
        end
      end
    end
  end

  # 下の数値が0の場合数字を下に落とす
  def drop

  end

  # @del_checkを条件に合わせて設定
  def solve_pazzle
    for i in 0..@lows - 1 do
      for j in 0..@cols - 1 do
        base = @map_info[i][j]
        unless base == 0
          case i
          # 上段
          when 0
            case j
            when 0 # 左上
              if @map_info[i][j + 1] == base &&
                @map_info[i + 1][j] == base
                @del_check[i][j] = true
                @del_check[i][j + 1] = true
                @del_check[i + 1][j] = true
              end
            when @cols - 1 #右上
              if @map_info[i][j - 1] == base &&
                @map_info[i + 1][j] == base
                @del_check[i][j] = true
                @del_check[i][j - 1] = true
                @del_check[i + 1][j] = true
              end
            else # 上段中央
              if @map_info[i][j - 1] == base &&
                @map_info[i][j + 1] == base &&
                @map_info[i + 1][j] == base
                @del_check[i][j - 1] = true
                @del_check[i][j + 1] = true
                @del_check[i + 1][j] = true
                @del_check[i][j] = true
              end
            end
          when @lows - 1
            case j
            when 0 # 左下
              if @map_info[i][j + 1] == base &&
                @map_info[i - 1][j] == base
                @del_check[i][j] = true
                @del_check[i][j + 1] = true
                @del_check[i - 1][j] = true
              end
            when @cols - 1 # 右下
              if @map_info[i][j - 1] == base &&
                @map_info[i - 1][j] == base
                @del_check[i][j] = true
                @del_check[i][j - 1] = true
                @del_check[i - 1][j] = true
              end
            else # 下段中央
              if @map_info[i][j - 1] == base &&
                @map_info[i][j + 1] == base &&
                @map_info[i - 1][j] == base
                @del_check[i][j] = true
                @del_check[i][j - 1] = true
                @del_check[i][j + 1] = true
                @del_check[i - 1][j] = true
              end
            end
          else
            case j
            when 0 # 左列中央
              if @map_info[i - 1][j] == base &&
                @map_info[i + 1][j] == base &&
                @map_info[i][j + 1] == base
                @del_check[i][j] = true
                @del_check[i - 1][j] = true
                @del_check[i + 1][j] = true
                @del_check[i][j + 1] = true
              end
            when @cols - 1 # 右列中央
              if @map_info[i - 1][j] == base &&
                @map_info[i + 1][j] == base &&
                @map_info[i][j - 1] == base
                @del_check[i][j] = true
                @del_check[i - 1][j] = true
                @del_check[i + 1][j] = true
                @del_check[i][j - 1]= true
              end
            else # その他
              if @map_info[i - 1][j] == base &&
                @map_info[i + 1][j] == base &&
                @map_info[i][j + 1] == base &&
                @map_info[i][j - 1] == base
                @del_check[i][j] = true
                @del_check[i - 1][j] = true
                @del_check[i + 1][j] = true
                @del_check[i][j + 1] = true
                @del_check[i][j - 1] = true
              end
            end
          end
        end
      end
    end
  end

  # 提出するために数値を変更
  def conversion_data
    @map_info.each do |row|
      row.map! { |element| element == 0 ? "." : element}
    end
  end
end

# 回答用フォーマット
def solve(input)
  input = input.split("\n")
  cols, lows = input.shift.split.map(&:to_i)
  map_info = []
  cols.times do
    data = input.shift.split("")
    modified_data = data.map { |element| element == '.' ? 0 : element.to_i }
    map_info << modified_data
  end
  map = Map.new(map_info)

  map.solve_pazzle
  map.delete_closs
  map.drop
  map.reset_del_check

  map.conversion_data
  pp map
end

solve(INPUT1)