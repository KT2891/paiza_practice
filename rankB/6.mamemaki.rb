INPUT = <<~"EOS"
1 7
5
3 6 1
3 5 1
3 6 1
3 3 1
7 3 1
EOS

class Field
  def initialize(rows, columns)
    @map = Array.new(rows){Array.new(columns,0)}
  end

  def throw(thorwing)
    range = (thorwing[:high] - 1) / 2
    x1, x2  = thorwing[:x] - range, thorwing[:x] + range
    y1, y2 = thorwing[:y] - range, thorwing[:y] + range
    if range == 0
      @map[y1][x1] += 1
      return
    end
    #上段の種まき
    unless @map[y1].nil? || y1 < 0
      for j in x1..x2 do
        @map[y1][j] += 1 unless @map[y1][j].nil?
      end
    end

    # 下段の種まき
    unless @map[y2].nil? || y2 < 0
      for j in x1..x2 do
        @map[y2][j] += 1 unless @map[y2][j].nil?
      end
    end

    # 右列の種まき
    unless @map[0][x1].nil? || x1 < 0
      for i in [(y1+1), 0].max..(y2-1)
        @map[i][x1] += 1 unless @map[i].nil? || @map[i][x1].nil?
      end
    end

    # 右列の種まき
    unless @map[0][x2].nil? || x2 < 0
      for i in [(y1+1), 0].max..(y2-1)
        @map[i][x2] += 1 unless @map[i].nil? || @map[i][x2].nil?
      end
    end
  end

  def get_map
    @map.each do |item|
      puts item.join(" ")
    end
  end
end


def solve(input)
  data = input.split("\n")
  rows, columns = data.shift.split.map(&:to_i)
  count = data.shift.to_i
  throwings = []

  count.times do
    high, x_coo, y_coo = data.shift.split.map(&:to_i)
    throwing = {high: high, x: x_coo - 1 , y: y_coo - 1}
    throwings << throwing
  end

  field = Field.new(rows, columns)

  throwings.each do |throw_para|
    field.throw(throw_para)
  end

  field.get_map

end

solve(INPUT)