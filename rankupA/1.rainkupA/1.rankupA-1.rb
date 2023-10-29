# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_snake_map_step1

INPUT = <<~"EOS"
3 3 2
###
###
...
2 2
1 1
EOS

class Map
  def initialize(info)
    @map_info = info
  end

  def get_string(orders)
    orders.each do |col, row|
      puts @map_info[col][row]
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

end

solve(STDIN.read)

# solve(INPUT)