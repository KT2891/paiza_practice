def fizzbuzz(num)
  if num % 15 == 0
    return "Fizz Buzz"
  elsif num % 3 == 0
    return "Fizz"
  elsif num % 5 == 0
    return "Buzz"
  else
    return num
  end
end

def solve(input)
  array = [*1..input]
  array.each do |n|
    puts fizzbuzz(n)
  end
end

input = gets.to_i
solve(input)