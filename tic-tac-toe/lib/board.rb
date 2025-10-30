class Board
  def print_grid(num)
    puts num.times.map{ "---+---+---" + "\n" + "   |"*2 }
  end
end

board = Board.new()
board.print_grid(3)