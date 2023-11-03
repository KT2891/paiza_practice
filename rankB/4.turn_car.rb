# https://paiza.jp/challenges/572/show

INPUT = <<~"EOS"
5
5
2
1
3
4
EOS

class Car
  attr :id, :turn_count
  def initialize(id)
    @id = id
    @turn_count = 0
  end

  def turn
    @turn_count += 1
  end

end


def solve(input)
  input = input.split("\n").map(&:to_i)
  count = input.shift
  cars = []
  count.times do
    car = Car.new(input.shift)
    cars << car
  end
  out_cars = []
  min_car_num = 1
  while cars.length > 0 do
    if cars[0].id == min_car_num
      out_cars << cars.shift
      min_car_num += 1
    else
      cars << cars.shift
      cars.last.turn
    end
  end

  result = out_cars.max_by{ |car| car.turn_count }.turn_count
  pp result 
end

solve(INPUT)