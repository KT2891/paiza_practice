# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_snake_map_boss

INPUT = <<~"EOS"
10 10
##########
..........
##########
##########
..........
#.#.#.#.#.
.#.#.#.#.#
#.#.#.#.#.
.#.#.#.#.#
..........
EOS

class Map
  def initialize(info)
    @map_info = info
  end
  # mapの各要素に対して左右が#になっている座標の出力をしている。
  # 外周の場合は境界部は無視して隣接するもののみが#であればよしとする。
  def check_string
    for i in 0..@map_info.length - 1 do
      for j in 0.. @map_info[0].length - 1 do
        case i
        when 0 then #上部外周
          case j
          when 0 then # 左上
            if @map_info[0][1] == "#" && @map_info[1][0] == "#"
              puts i.to_s + " " + j.to_s
            end
          when @map_info.length - 1 then # 右上
            if @map_info[0][-2] == "#" && @map_info[1][-1] == "#"
              puts i.to_s + " " + j.to_s
            end
          else #上部外周の中間
            if @map_info[0][j - 1] == "#" &&
              @map_info[0][j + 1] == "#" &&
              @map_info[1][j] == "#" then
              puts i.to_s + " " + j.to_s
            end
          end
        when @map_info.length - 1 then #下部外周
          case j
          when 0 then #左下
            if @map_info[-1][1] == "#" && @map_info[-2][0] == "#"
              puts i.to_s + " " + j.to_s
            end
          when @map_info.length - 1 then #右下
            if @map_info[-1][-2] == "#" && @map_info[-2][-1] == "#"
              puts i.to_s + " " + j.to_s
            end
          else #下部外周の中間
            if @map_info[-1][j - 1] == "#" &&
              @map_info[-1][j + 1] == "#" &&
              @map_info[-2][j] == "#" then
              puts i.to_s + " " + j.to_s
            end
          end
        else #上部、下部以外
          case j
          when 0 then #左外周
            if @map_info[i + 1][0] == "#" &&
              @map_info[i - 1][0] == "#" &&
              @map_info[i][1] == "#" then
              puts i.to_s + " " + j.to_s
            end
          when @map_info.length - 1 then #右外周
            if @map_info[i + 1][-1] == "#" &&
              @map_info[i - 1][-1] == "#" &&
              @map_info[i][-2] == "#" then
              puts i.to_s + " " + j.to_s
            end
          else #中央
            if @map_info[i + 1][j] == "#" &&
              @map_info[i - 1][j] == "#" &&
              @map_info[i][j - 1] == "#" &&
              @map_info[i][j + 1] == "#" then
              puts i.to_s + " " + j.to_s
            end
          end
        end
      end
    end
  end
end

def solve(input)
  input = input.split("\n")
  cols, lows = input.shift.split.map(&:to_i)
  map_info = []
  cols.times do 
    map_info << input.shift.split("")
  end

  map = Map.new(map_info)

  map.check_string

end

# solve(STDIN.read)

solve(INPUT)