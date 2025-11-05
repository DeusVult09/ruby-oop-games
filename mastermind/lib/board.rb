require 'colorize'

# brief method plan: 
# A way to set or generate the secret code ✅
# A method to receive a player’s guess.
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

  def input_guess
    puts 'Dear, Guesser, please enter your name: '
    name = gets.chomp
    @guesser = Guesser.new(name)
    puts "Dear, #{name}, you need to guess color combinations secretly written by the computer. 
    Only for 4 colors must be guessed. Please, enter your first guess:"
    @guess_code = gets.chomp.upcase.chars
  end
  
end



board = Board.new
board.generate_code
puts board.secret_code.join(' ')
