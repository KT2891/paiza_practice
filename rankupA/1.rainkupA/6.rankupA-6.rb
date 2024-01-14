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
    @del_check = Array.new(@lows, Array.new(@cols, false))
  end

  def reset_del_check
    @def_check.each do |row|
      row.map! { false }
    end
  end

  def delete_closs
    
  end

  def drop

  end

  def solve_pazzle
    
  end

  def conversion_data
    
  end
end

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

  pp map
end

solve(INPUT1)