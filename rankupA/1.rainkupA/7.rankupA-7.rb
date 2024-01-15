INPUT1 = <<~"EOS"
5 1
2 2
1 3
6 1
6 3
7 4
EOS

INPUT2 = <<~"EOS"
3 3
1 2
4 2
4 5
EOS

INPUT3 = <<~"EOS"
10 10
66 7
59 87
79 59
76 12
27 45
73 87
13 49
77 81
21 95
88 75
EOS

class Map
  def initialize(xsize, ysize)
    @coordinate = Array.new(ysize + 2) { Array.new(xsize + 2,0)}
  end

  def set_mount(mount_info)
    mount_info.each do |mount|
      @coordinate[mount[1]][mount[0]] = 1
    end
  end

  def eruption(radius)
    changes = []

    for i in 0..@coordinate.length - 1 do
      for j in 0..@coordinate[i].length - 1 do
        if @coordinate[i][j] == 1
          (i - radius).upto(i + radius) do |x|
            (j - radius).upto(j + radius) do |y|
              if x.between?(0, @coordinate.length - 1) && y.between?(0, @coordinate[x].length - 1)
                if manhattan_distance(i, j, x, y) <= radius
                  changes << [x, y]
                end
              end
            end
          end
        end
      end
    end

    changes.each do |x, y|
      @coordinate[x][y] = 1
    end
  end

  def count_connected_components
    visited = Array.new(@coordinate.length) { Array.new(@coordinate[0].length, false) }
    count = 0

    @coordinate.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        if cell == 1 && !visited[i][j]
          dfs(i, j, visited)
          count += 1
        end
      end
    end

    count
  end


  def get_info
    @coordinate.each do |row|
      puts row.join
    end
    puts "---------"
  end

  private

  def manhattan_distance(x1, y1, x2, y2)
    (x1 - x2).abs + (y1 - y2).abs
  end

  def dfs(x, y, visited)
    return if x < 0 || y < 0 || x >= @coordinate.length || y >= @coordinate[x].length || visited[x][y] || @coordinate[x][y] == 0

    visited[x][y] = true
    dfs(x + 1, y, visited)
    dfs(x - 1, y, visited)
    dfs(x, y + 1, visited)
    dfs(x, y - 1, visited)
  end
end


# 回答用フォーマット
def solve(input)
  input = input.split("\n")
  count, radius = input.shift.split.map(&:to_i)
  mount_info = []
  count.times do
    data = input.shift.split.map(&:to_i)
    mount_info << data
  end
  xsize = 0
  ysize = 0
  mount_info.each do |low|
    xsize = low[0] if low[0] > xsize
    ysize = low[1] if low[1] > ysize
  end

  map = Map.new(xsize, ysize)
  map.set_mount(mount_info)
  map.eruption(radius)

  puts map.count_connected_components

end

solve(INPUT3)
