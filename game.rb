require './randomizer'

class Game

  puts "Welcome to the Math Game!"
  puts "Please enter the name for player 1:"

  print "> "
  player1 = $stdin.gets.chomp

  puts "Please enter the name for player 2:"

  print "> "
  player2 = $stdin.gets.chomp

  puts player1
  puts player2

end
