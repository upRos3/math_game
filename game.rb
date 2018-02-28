require './question'
require './player'
require 'pry'

module Math_Game
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

      puts "\nRules of the game:"
      puts 'You start with 3 lives, get one wrong, you lose a life!'
      puts "Lose all your lives and it's game over!"

      ready = false

      until ready

        puts "\nType 'start' to start game:"
        print '> '

        confirm = gets.chomp.downcase

        if confirm != 'start'
          puts "\nObviously you're not ready yet\n"
        else
          puts "\nGame commencing!\n"
          ready = true
        end
      end
    end

    def game_start
      game_over = false
      counter = 0

      until game_over
        current_player = @players[counter].name
        lives = @players[counter].lives

        puts "\nQuestion for #{current_player}:"

        question = Question.new
        puts question.get

        print '> '
        # binding.pry
        returned_answer = gets.chomp

        if returned_answer =~ /([A-z])\w+/
          puts "That's not a number! -1 life for wasting time!"
          @players[counter].lives -= 1
        else
          safe_answer = returned_answer.to_i
          if question.answer == safe_answer
            puts "\nCorrect!\n"
          else
            @players[counter].lives -= 1
            if lives < 0
              puts "\n#{current_player} is really bad at math! GAME OVER!"
            else
              puts "\nWRONG! -1 life :(\n"
              puts "#{current_player} has #{lives} lives left"
            end
          end
        end

        game_over = lives < 0

        counter = counter == 0 ? 1 : 0
      end
    end
  end
end
