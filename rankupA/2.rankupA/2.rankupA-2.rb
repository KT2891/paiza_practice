# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_snake_move_step1

INPUT = <<~"EOS"
3 3
.#.
...
...
EOS

class Map
  def initialize(map_info)
    @map_info = map_info
  end

  def get_position
    for i in 0..@map_info.length - 1 do
      for j in 0..@map_info[0].length - 1 do
        if @map_info[i][j] == "#"
          puts i.to_s + " " + j.to_s
        end
      end
    end
  end

end

def solve(input)
  input = input.split("\n")
  cols, rows = input.shift.split.map(&:to_i)
  map_info = []
  cols.times do
    map_info << input.shift.split("")
  end

  map = Map.new(map_info)
  map.get_position

end

# solve(INPUT)
solve(STDIN.read)