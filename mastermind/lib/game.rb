require_relative 'board'
require_relative 'guesser'
require_relative 'mastermind'

class Game
  def initialize
    show_rules
    codebreaker_setup
    board = Board.new
    board.generate_code
    puts board.secret_code.join(' ')
  end

  def start
    play_game
  end

  def play_game
    
  end

  def show_rules
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
    @name = gets.chomp
    @codebreaker = Codebreaker.new(name)
    
  end
end