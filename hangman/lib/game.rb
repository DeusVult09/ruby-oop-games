require_relative 'game_serializer'
require_relative 'save_game'
require_relative 'player'

class Game
  def initialize
    show_rules
    player_setup

  end

  def show_rules
    puts <<~RULES
      Welcome to Hangman game! The computer(host) will randomly choose a secret word between 5 and 12 letters.
      Your goal is to guess the word one letter at a time.
      You start with 7 incorrect guesses allowed.
      Each time you guess a letter that is not in the word, you lose one life.
      If you reveal all letters before running out of lives — you win!
      If you use all 7 incorrect guesses — you lose.
      You can also save your game at any time and load it later.
      Do you want to continue? (yes/no)
    RULES
    input = gets.chomp.downcase
    exit unless input == 'yes'
  end

  def player_setup
    puts 'Dear player, enter your name:'
    @name = gets.chomp
    @player = Player.new(name)
  end

  def select_word
    random_word = File.readlines('words.txt', chomp: true)
    filtered_word = random_word.select { |w| w.length.between?(5, 12) }
    @secret_word =  filtered_word.sample
  end

  def play_game
    select_word
    @blank_word = Array.new(@secret_word.length, '_')
    puts @blank_word.join('')

    @turn = 1
  end

  def loop_guess
    puts 'Do you want to save your game? (y/n)'
    @answer = gets.chomp.downcase
    if @answer == 'y'
      GameSerializer.save(self) 
      puts 'You successfully saved the game!'
    end

    
  end

  def display_feedback
    puts 
  end
end

