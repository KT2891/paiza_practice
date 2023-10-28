INPUT1 = <<~"EOS"
6 3
3 2
1 6
2 5
EOS

INPUT2 = <<~"EOS"
12 6
4 6
4 8
4 10
4 12
4 2
4 4
EOS

class LongTable
  attr_reader :chairs
  def initialize(count)
    @chairs = Array.new(count, false)
  end

  def set_chair(count, start, chair_count)
    i = 0
    count.times do 
      if (start + i) > chair_count
        i -= chair_count
      end
      if @chairs[start + i - 1] 
        return 
      end
      i += 1
    end
    j = 0
    count.times do 
      if start + j > chair_count
        j -= chair_count
      end
      @chairs[start + j - 1] = true
      j += 1
    end
  end

end

def solve(input)
  input_line = input.split("\n")
  chair_count, group_count = input_line.shift.split.map(&:to_i)
  groups = []
  group_count.times do
    group_info = input_line.shift.split.map(&:to_i)
    group_hash = { people: group_info[0], start: group_info[1]}
    groups << group_hash
  end

  table = LongTable.new(chair_count)
  groups.each do |group|
    table.set_chair(group[:people], group[:start], chair_count)
  end

  puts table.chairs.count(true)
end

solve(STDIN.read)