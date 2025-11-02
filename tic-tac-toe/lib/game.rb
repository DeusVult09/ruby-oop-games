require_relative 'board'
require_relative 'player'

# introducing game rules for better user experience

class Game
  def initialize
    show_rules
    players_setup
    @board = Board.new
    @current_player = @player1
  end

  def show_rules
    puts "Welcome to Tic-Tac-Toe Game!"
    puts "Before proceeding to the game, check out some rules:"
    puts "- There are two players in this game. 
    Each player takes a turn placing their symbol in empty squares.
    The first player to get 3 of their symbols in a row (up, down, across or diagonally)
    is the winner. When all 9 squares are full, the game ends in a draw."
    puts "\nDo you want to continue? (yes/no)"
    
    input = gets.chomp.downcase
    unless input == "yes"
    puts "You exited the game."
    exit
    end
  end

  # assigning "X" or "O" to players. I decided to assign symbols automatically
  # so, Player 1 will always be "X" and Player 2 "O" respectively. 

  def players_setup
    puts "Enter Player 1 your name to play 'X':"
    name1 = gets.chomp
    puts "Enter Player 2 your name to play 'O':"
    name2 = gets.chomp

    @player1 = Player.new(name1, "X")
    @player2 = Player.new(name2, "O")
  end
end