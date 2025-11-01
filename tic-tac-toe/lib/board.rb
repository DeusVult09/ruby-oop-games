class Board
  attr_accessor :grid 

  def initialize
    @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def print_grid
    rows = [0, 1, 2].map do |i|
      row_values = @grid[i * 3, 3]
      row_values.join(" | ")
    end
    puts rows.join("\n--+---+--\n")
  end
end

# updating position of the board based on player choice: "X" or "O"

def rules
  puts "Welcome to Tic-Tac-Toe Game!
  Before proceeding to the game, check out some rules:
  There are two players in this game. Each player takes
  a turn putting their symbol in empty squares. 
  The first player to get 3 of their symbols in a row (up, down, across or diagonally) 
  is the winner. When all 9 squares are full, the game is over."

  puts "Do you want to continue?"
  input = gets.chomp.downcase

  unless input == "yes"
    puts "You exit the game"
  else
    puts "Please, make your choice: 'X' or 'O'"
  end
end   

def board_update(position, choice)
  
end
