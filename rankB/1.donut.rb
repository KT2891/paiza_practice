INPUT1 = <<~"EOS"
  5 5
  ####.
  #.###
  ###.#
  #.###
  ###.#
EOS

INPUT2 = <<~"EOS"
6 3
###
#..
#..
###
#.#
###
EOS

def check_donut?(art, i, j)
  if
    art[i + 1][j] == "#" &&
    art[i + 2][j] == "#" &&
    art[i][j + 1] == "#" &&
    art[i + 1][j + 1] == "." &&
    art[i + 2][j + 1] == "#" &&
    art[i][j] == "#" &&
    art[i + 1][j + 2] == "#" &&
    art[i + 2][j + 2] == "#"
    then
    return true
  else
    return false
  end
end

def count_donut(art, rows, cols)
  donut_count = 0
  for i in 0..(rows - 3) do
    for j in 0..(cols - 3) do
      base = art[i][j]
      if base == "#"
        donut_count += 1 if check_donut?(art, i, j)
      end
    end
  end

  return donut_count
end


def solve(input)
  input_lines = input.split("\n")
  rows, cols = input_lines.shift.split.map(&:to_i)

  art = []
  rows.times do
    art << input_lines.shift.split("")
  end

  puts count_donut(art, rows, cols)

end

solve(INPUT2)