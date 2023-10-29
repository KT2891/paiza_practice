# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_snake_map_step2

INPUT = <<~"EOS"
3 3 1
...
...
...
0 0
EOS

class Map
  def initialize(info)
    @map_info = info
  end

  def get_string(orders)
    orders.each do |col, row|
      @map_info[col][row] = "#"
    end
  end

  def show
    @map_info.each do |row|
      row.each do |element|
        print element.to_s # スペースを挟んで出力
      end
      puts '' # 各行の最後に改行
    end
  end
end

def solve(input)
  input = input.split("\n")
  cols, lows, counts = input.shift.split.map(&:to_i)
  map_info = []
  cols.times do 
    map_info << input.shift.split("")
  end
  orders = []
  counts.times do
    orders << input.shift.split.map(&:to_i)
  end

  map = Map.new(map_info)
  map.get_string(orders)

  map.show

end

solve(STDIN.read)

# solve(INPUT)