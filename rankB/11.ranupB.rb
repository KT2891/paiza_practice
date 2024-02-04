INPUT1 = <<~"EOS"
3
3
0 0 10 10
0 5 10 15
20 0 30 10
EOS

INPUT2 = <<~"EOS"
5
1
50 0 100 50
0 40 60 70
100 30 130 100
40 90 60 110
30 100 50 120
EOS

class Grid
  def initialize(grid_size)
    @grid = Array.new(grid_size + 1) { Array.new(grid_size + 1, 0) }
    @visited = {} # 訪問済みの水たまりを記録するハッシュ
    @visit = Array.new(grid_size + 1) { Array.new(grid_size + 1, false) }
    @start = []
    @num = 1
  end

  def set_puddle(x, y, a, b)
    for i in y..b
      for j in x..a
        @grid[i][j] = @num
      end
    end
    @num += 1
  end

  def set_start(first_position)
    for i in 0..@grid.length - 1
      for j in 0..@grid[0].length - 1
        if @grid[i][j] == first_position
          @start = [i, j]
          return
        end
      end
    end
  end

  def explore(x, y)
    return if x < 0 || y < 0 || x >= @grid.length || y >= @grid[0].length # グリッドの範囲外
    return if @visit[x][y]
    return if @grid[x][y] == 0 # 水たまりではない領域

    @visited[@grid[x][y]] = true # 現在の水たまりを訪問済みとして記録
    @visit[x][y] = true

    # 隣接する領域を探索
    explore(x+1, y)
    explore(x-1, y)
    explore(x, y+1)
    explore(x, y-1)
    explore(x+1, y+1)
    explore(x-1, y+1)
    explore(x+1, y-1)
    explore(x-1, y-1)
  end

  def count_puddles
    explore(@start[0], @start[1])
    return @visited.size # 訪問済みの異なる水たまりの数
  end

  def get_visited(data)
    @visited.each do |key, value|
      data << key
    end
    return data
  end

end

def solve(input)
  data = input.split("\n")
  puddle = data.shift.to_i
  first_position = data.shift.to_i
  rectangles = data.map { |rectangle| rectangle.split.map(&:to_i)}

  max_plot = 0
  rectangles.each do |rectangle|
    if max_plot < rectangle.max
      max_plot = rectangle.max
    end
  end

  grid = Grid.new(max_plot)

  rectangles.each do |x, y, a, b|
    grid.set_puddle(x, y, a, b)
  end
  data = []
  grid.set_start(first_position)
  grid.count_puddles
  data = grid.get_visited(data)
  puts data.sort
end

solve(INPUT2)