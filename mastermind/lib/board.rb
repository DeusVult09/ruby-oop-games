require 'colorize'

# brief method plan
# A way to set or generate the secret code ✅
# A method to receive a player’s guess.
# A method to calculate feedback (reds + whites).
# A method to print that feedback cleanly.

class Board
  attr_accessor :guess_code
  attr_reader :secret_code

  def initialize
    @colors = ['RED'.red, 'BLUE'.blue, 'GREEN'.green, 'YELLOW'.yellow]
  end

  def generate_code
    @secret_code = Array.new(@colors.length) { @colors.sample }
  end
  
end

board = Board.new
board.generate_code
puts board.secret_code.join(' ')
