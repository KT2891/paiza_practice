# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_snake_map_step3

INPUT = <<~"EOS"
3 3
#.#
.#.
...
EOS

class Map
  def initialize(info)
    @map_info = info
  end
  # mapの各要素に対して左右が#になっている座標の出力をしている。なお、右端、左端の場合は片側のみを確認している。
  def check_string
    i = 0
    @map_info.each do |row|
      for j in 0..(row.count - 1) do
        case j
        when 0 then
          if row[1] == "#"
            puts i.to_s + " " + j.to_s
          end
        when row.count - 1 then
          if row[-2] == "#"
            puts i.to_s + " " + j.to_s
          end
        else
          if row[j - 1] == "#" && row[j + 1] == "#"
            puts i.to_s + " " + j.to_s
          end
        end
      end
      i += 1
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

  # map.get_string(orders)
  # map.show

  map.check_string

end

# solve(STDIN.read)

solve(INPUT)