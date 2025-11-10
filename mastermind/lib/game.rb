require_relative 'board'
require_relative 'guesser'
require_relative 'mastermind'

class Game
  def initialize
    show_rules
    codebreaker_setup
    choose_role
    @board = Board.new
    if @mastermind
      @mastermind.generate_code
      @board.secret_code = @mastermind.generate_code
    end
  end

  def start
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
    puts 'Dear, Codebreaker, please enter your name: '
    @name = gets.chomp
  end

  def choose_role
    puts 'Would you like to be the (1) Masterind or (2) Codebreaker? Enter number only:'
    choice = gets.chomp.to_i
    if choice == 1
      @mastermind = Mastermind.new
    else
      @codebreaker = Codebreaker.new(@name)
    end
  end

  def play_game
    round_count = 1
    puts "Dear, #{@name}, you need to guess color combinations secretly written by the computer 🔮"

    loop do 
      @codebreaker.decode
      @board.guess_code = @codebreaker.guess_code
      puts "ROUND #{round_count} <<< #{@board.guess_code}"
      @board.feedback  

      if @board.reds == 4
        puts 'Congrats! You broke the secret code of the Mastermind 🏆'
        break
      end
      round_count += 1

      if round_count == 12
        puts "Game is over! You couldn't break the secret code of Mastermind"
        break
      end
    end

    puts 'Do you want to restart the game? (y/n)'
    answer = gets.chomp.downcase
    restart if answer == 'y'

  end

  def restart 
    @board = Board.new
    @mastermind.secret_code if @mastermind
    @board.guess_code = []
  end
    play_game
end
