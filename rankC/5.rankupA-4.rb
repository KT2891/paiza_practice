# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_snake_map_step3

INPUT = <<~"EOS"
4 4
#.#.
.#.#
.#.#
#.#.
EOS

class Map
  def initialize(info)
    @map_info = info
  end
  # mapの各要素に対して左右が#になっている座標の出力をしている。なお、右端、左端の場合は片側のみを確認している。
  def check_string
    for i in 0..@map_info.length - 1 do
      for j in 0.. @map_info[0].length - 1 do
        case i
        when 0 then
          if @map_info[1][j] == "#"
            puts i.to_s + " " + j.to_s
          end
        when @map_info.length - 1 then
          if @map_info[-2][j] == "#"
            puts i.to_s + " " + j.to_s
          end
        else
          if @map_info[i - 1][j] == "#" && @map_info[i + 1][j] == "#"
            puts i.to_s + " " + j.to_s
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