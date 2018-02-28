require 'pry'

class Game
  attr_reader :players
  def initialize
    @players = []
    @players[0] = Player.new("Player 1")
    @players[1] = Player.new("Player 2")

  end

  def introduction
    puts "Welcome to the Math Game!"
    puts "Please enter the name for player 1:"

    print "> "
    @players[0].name = gets.chomp

    puts "Please enter the name for player 2:"

    print "> "
    @players[1].name = gets.chomp

    puts "Game commencing!"
  end

  def game_start

    game_over = false
    counter = 0

    while !game_over do

      puts "Question for #{@players[counter].name}"

      question = Question.new
      puts question.get

      print "> "
      returned_answer = gets.chomp.to_i
      # binding.pry
      if question.answer == returned_answer
        puts "Correct! You so smaaaht"
      else
        puts "You St00pid -1 point"
        @players[counter].lives -= 1
      end

      game_over = @players[0].lives == 0 || @players[1].lives == 0

      counter = counter == 0 ? 1 : 0
    end

    if game_over
      if @players[0].lives == 0
        puts "#{@players[1].name} wins!"
      end

      if @players[1].lives == 0
        puts "#{@players[0].name} wins!"
      end
    end

  end
end
