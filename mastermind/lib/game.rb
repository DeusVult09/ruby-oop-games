require_relative 'board'
require_relative 'guesser'
require_relative 'mastermind'
require 'colorize'

class Game
  def initialize
    show_rules
    codebreaker_setup
    
    @codebreaker = Codebreaker.new(@name)
    @mastermind = Mastermind.new
    @mastermind.generate_code

    @board = Board.new
    @board.secret_code = @mastermind.secret_code

  end

  def start(human_choice)
    play_game
  end

  def show_rules
    puts 'Welcome to the Mastermind game. Here is the brief rules to intruduce before we start. You have two options to be: Mastermind or Codebreaker.'
    puts 'The Mastermind sets a secret code of colored pegs and the codebreaker guesses it in 12 turns. After each guess, the codemaker uses two types of key pegs to provide feedback:
    a red peg for a correctly colored peg in the correct position and a white peg for a correctly colored peg in the wrong position. 
    The goal is to guess the code using the fewest attempts.'
    puts 'Do you want to continue? (yes/no)'
    input = gets.chomp.downcase
    exit unless input == 'yes' 
  end

  def codebreaker_setup
    puts 'Dear Codebreaker, please enter your name: '
    @name = gets.chomp
  end

  def choose_role
    puts 'Would you like to be the (1) Mastermind or (2) Codebreaker? Enter number only:'
    choice = gets.chomp.to_i
    @board = Board.new

    if choice == 1
      @mastermind = Mastermind.new
      @mastermind.set_code
      @codebreaker = Codebreaker.new('Computer')
      computer_play
    else
      @codebreaker = Codebreaker.new(@name)
      @mastermind = Mastermind.new
      @mastermind.generate_code
      play_game
    end
  end

  def play_game
    round_count = 1
    puts "Dear #{@name}, you need to guess color combinations secretly written by the computer 🔮"
    puts 'Enter your color guesses (4): ' 

    loop do 
      @codebreaker.human_guess
      @board.guess_code = @codebreaker.guess_code
      puts "ROUND #{round_count} <<< #{@board.guess_code}"
      @board.feedback  

      if @board.reds == 4
        puts 'Congrats! You cracked the secret code of the Mastermind 🏆'
        break
      end
      round_count += 1

      if round_count == 12
        puts "Game is over! You failed to crack the secret code ❌ "
        puts "Here is the secret code:"
        puts @board.secret_code.map { |c| c.colorize(c.downcase.to_sym) }.join(' ')
        break
      end
    end

    puts 'Do you want to restart the game? (y/n)'
    answer = gets.chomp.downcase
    if answer == 'y'
      restart
    else 
      puts 'Goodbye!'
      return
    end
  end

  def computer_play
    round_count = 1

    loop do
      @codebreaker.computer_guess
      @board.secret_code = @mastermind.secret_code
      @board.guess_code = @codebreaker.guess_code

      puts "ROUND #{round_count} <<< #{@board.guess_code}"
      @board.feedback

      if @board.reds == 4
        puts 'Computer cracked your code ❌'
        break
      elsif round_count == 12
        puts 'You won 🏆 Computer failed to crack your secret code'
        break
      end
      round_count += 1
    end
    
    puts 'Do you want to restart the game? (y/n)'
    answer = gets.chomp.downcase
    if answer == 'y'
      restart
    else 
      puts 'Goodbye!'
      return
    end
  end

  def restart 
    @board = Board.new
    @mastermind.secret_code if @mastermind
    @board.guess_code = []
    play_game
  end
end
