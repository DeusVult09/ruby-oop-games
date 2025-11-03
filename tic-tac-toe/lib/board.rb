class Board
  attr_accessor :grid

  def initialize
    @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def print_grid
    rows = [0, 1, 2].map do |i|
      row_values = @grid[i * 3, 3]
      row_values.join(' | ')
    end
    puts rows.join("\n--+---+--\n")
  end
end

# updating position of the board based on player choice: "X" or "O"

def board_update(position, choice)
  @grid[position - 1] = choice
end

# this one checks if chosen position is occupied or not
def position_empty?(position)
  @grid[position - 1].is_a?(Integer)
end

def full_board?
  @grid.none? { |cell| cell.is_a?(Integer) }
end