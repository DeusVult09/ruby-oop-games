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
    puts 'Welcome to Tic-Tac-Toe Game!'
    puts 'Before proceeding to the game, check out some rules:'
    puts "There are two players in this game.
    Each player takes a turn placing their symbol in empty squares.
    The first player to get 3 of their symbols in a row (up, down, across or diagonally)
    is the winner. When all 9 squares are full, the game ends in a draw."
    puts 'Do you want to continue? (yes/no)'

    input = gets.chomp.downcase
    return if input == 'yes'

    puts 'You exited the game'
    exit
  end

  # assigning "X" or "O" to players. I decided to assign symbols automatically
  # so, Player 1 will always be "X" and Player 2 "O" respectively.

  def players_setup
    puts "Player 1, enter your name to play 'X':"
    name1 = gets.chomp
    puts "Player 2, enter your name to play 'O':"
    name2 = gets.chomp

    @player1 = Player.new(name1, 'X')
    @player2 = Player.new(name2, 'O')
  end

  def play_game
    loop do
      @board.print_grid
      puts "#{@current_player.name}, please choose pisitions from 1 to 9:"
      position = gets.chomp.to_i

      if @board.position_empty?(position)
        @board.board_update(position, @current_player.choice)
        next_player
      else
        puts 'Position occupied, try again!'
      end
      whos_the_winner?
    end
  end

  private

  def next_player
    if @current_player == player1
      @current_player == player2
    else
      @current_player == player1
    end
  end

  def whos_the_winner?
    @winning_rows = [1, 2, 3], [4, 5, 6], [7, 8, 9]
    @winning_cols = [1, 4, 7], [2, 5, 8], [3, 6, 9]
    @winning_diags = [1, 5, 9], [3, 6, 7]

    loop do
      @board.print_grid
      if @board.board_update(position, @current_player.choice).include?(@winning_rows, @winning_cols, @winning_diags)
        puts "Congrats! 'X' won the game!"
      else
        'X lost, O won the game!'
      end
    end
  end
end
