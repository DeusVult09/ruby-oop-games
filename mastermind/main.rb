require_relative 'lib/game'

board = Board.new
board.generate_code
puts board.secret_code.join(' ')