INPUT = <<~"EOS"
10 3 2
EOS

def shuffle(cards,set_count)
  set_cards = []
  cards.length.div(set_count).times do 
    data = cards.slice!(0..set_count-1)
    set_cards << data
  end
  set_cards << cards unless cards.empty?

  i =  -1
  shuffle_cards = []
  set_cards.length.times do
    shuffle_cards << set_cards[i]
    i -= 1
  end
  
  return shuffle_cards.flatten
end

def solve(input)
  card_count, set_count, shuffle_count = input.split.map(&:to_i)
  cards = [*1..card_count]
  shuffle_count.times do
    cards = shuffle(cards, set_count)
  end

  puts cards
end

# solve(STDIN.read)
solve(INPUT)