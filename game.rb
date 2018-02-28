require 'pry'

class Game
  attr_reader :players
  def initialize
    @players = []
    @players[0] = Player.new('Player 1')
    @players[1] = Player.new('Player 2')
  end

  def introduction
    puts 'Welcome to the Math Game!'
    puts 'Please enter the name for player 1:'

    print '> '
    @players[0].name = gets.chomp

    puts 'Please enter the name for player 2:'

    print '> '
    @players[1].name = gets.chomp

    puts 'Game commencing!'
  end

  def game_start
    game_over = false
    counter = 0
    new_line = "\n"

    until game_over

      puts new_line + "Question for #{@players[counter].name}:"

      question = Question.new
      puts question.get

      print '> '
      returned_answer = gets.chomp.to_i

      if question.answer == returned_answer
        puts new_line + 'Correct! You so smaaaht' + new_line
      else
        puts new_line + 'You St00pid -1 point' + new_line
        @players[counter].lives -= 1
      end

      game_over = @players[0].lives == 0 || @players[1].lives == 0

      counter = counter == 0 ? 1 : 0
    end

    if game_over
      if @players[0].lives == 0
        puts new_line + "#{@players[1].name} wins!" + new_line
      end

      if @players[1].lives == 0
        puts new_line + "#{@players[0].name} wins!" + new_line
      end
    end
  end
end
