require_relative 'guesser' 
require 'colorize'

# brief method plan: 
# A way to set or generate the secret code ✅
# A method to receive a player’s guess.✅
# A method to calculate feedback (reds + whites).
# A method to print that feedback cleanly.

class Board
  attr_accessor :guess_code
  attr_reader :secret_code

  def initialize
    @colors = ['RED'.red, 'BLUE'.blue, 'GREEN'.green, 'YELLOW'.yellow]
    @secret_code = Array.new
  end

  def generate_code
    @secret_code = Array.new(@colors.length) { @colors.sample }
  end

  # for now i am just assuming the player choses to guess the code of the computer. Later I will add rules method including refactoring
  
  def rules
    puts 'Welcome to the Mastermind game. Here is the brief rules to intruduce before we start. You have two options to be: Mastermind or Codebreaker.'
    puts 'The Mastermind sets a secret code of colored pegs and the codebreaker guesses it in 12 turns. After each guess, the codemaker uses two types of key pegs to provide feedback:
    a red peg for a correctly colored peg in the correct position and a white peg for a correctly colored peg in the wrong position. 
    The goal is to guess the code using the fewest attempts.'
    puts 'Do you want to continue? (yes/no)'
  end
  
  def choose_role
    puts 'Would you like to be the (1) Masterind or (2) Codebreaker? Enter number only:'
    choice = gets.chomp.to_i
    if choice == 1
      Masterind
    else
      Codebreaker
    end
  end

  def codebreaker_setup
    puts 'Dear, Codebreaker, please enter your name: '
    name = gets.chomp
    @codebreaker = Codebreaker.new(name)
    
  end

  def guess_code
    puts 'Dear, #{name}, you need to guess color combinations secretly written by the computer.'
    @guess_code = gets.chomp.upcase.chars
  end

  def feedback
    @red = 
    @white = 
  end
  
end



board = Board.new
board.generate_code
puts board.secret_code.join(' ')
