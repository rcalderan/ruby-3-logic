def welcome
  puts "Wellcome to game"
  puts "What's your name?"
  name=gets.strip
  puts "\n\n\n\n\n\n\n"
  puts "The game will start soon, #{name}"
end

def writeMap(map)
  puts map
end

def move
  puts "Set your move:"
  movement = gets.strip
end
