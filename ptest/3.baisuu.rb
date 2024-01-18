a = 7777777
i = 1
count = 0
while true do
  solve = 7 * i
  break if solve > 7777777
  count += solve.to_s.count("7")
i += 1
end

pp count