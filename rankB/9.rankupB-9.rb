INPUT1 = <<~"EOS"
2 4 5
0 0 3
2 1 3
2 0 2
2 1 3
1 0 2
3 2 3
EOS

INPUT2 = <<~"EOS"
1 10 10
0 0 10
0 0 10
0 0 10
EOS

class Map
  def initialize(xsize, ysize)
    @coordinate = Array.new(xsize) { Array.new(ysize,0)}
  end

  def play(player_num, turn)
    x = turn[0]
    y = turn[1]
    s = turn[2]
    for i in 0..s - 1do
      for j in 0..s - 1 do
        target_y = x + i
        target_x = y + j
        if target_x.between?(0, @coordinate.length - 1) && target_y.between?(0, @coordinate[0].length - 1)
          case player_num
          when 1
            @coordinate[target_x][target_y] += 1 unless @coordinate[target_x][target_y] == 1
          when 2
            @coordinate[target_x][target_y] += 2 unless @coordinate[target_x][target_y] == 2
          when 3
            @coordinate[target_x][target_y] += 3 unless @coordinate[target_x][target_y] == 3
          end
        end
      end
    end
    update_coordinate
  end

  def game_result
    player1_score, player2_score, player3_score = 0,0,0
    @coordinate.each do |low|
      player1_score += low.count(1)
      player2_score += low.count(2)
      player3_score += low.count(3)
    end
    puts "#{player1_score} #{player2_score} #{player3_score}"
  end

  private

  def update_coordinate
    @coordinate.each_with_index do |row, x|
      row.each_with_index do |value, y|
        change_coordinate(x, y)
      end
    end
  end

  def change_coordinate(x, y)
    @coordinate[x][y] = 1 if @coordinate[x][y] == 5
    @coordinate[x][y] = 2 if @coordinate[x][y] == 4
  end
end

# 回答用フォーマット
def solve(input)
  input = input.split("\n")
  turn, xsize, ysize = input.shift.split.map(&:to_i)
  turn_info = []
  (turn*3).times do
    data = input.shift.split.map(&:to_i)
    turn_info << data
  end

  map = Map.new(xsize, ysize)

  turn.times do
    map.play(1, turn_info.shift)
    map.play(2, turn_info.shift)
    map.play(3, turn_info.shift)
  end
  map.game_result

end

solve(INPUT2)
