require_relative 'lib/game'
require_relative 'lib/board'

board = Board.new
board.generate_code
puts board.secret_code.join(' ')