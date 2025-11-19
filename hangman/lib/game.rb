require_relative 'game_serializer'
require_relative 'save_game'
require_relative 'player'

class Game
  attr_accessor :secret_word, :blank_word, :turns, :player, :guess_letter

  def initialize
    show_rules
    puts 'Do you want to load a saved game? (yes/no)'
    if gets.chomp.downcase == 'yes'
      GameSerializer.load(self)
    else
      player_setup
      select_word
    end
    play_game
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
    @player = Player.new(@name)
  end

  def select_word
    random_word = File.readlines('words.txt', chomp: true)
    filtered_word = random_word.select { |w| w.length.between?(5, 12) }
    @secret_word =  filtered_word.sample
    @blank_word = Array.new(@secret_word.length, '_')
    puts @blank_word.join('')
    @turns = 7
  end

  def play_game
    while @turns > 0 && @blank_word.join != @secret_word
      puts "Word: #{@blank_word.join(' ')}"
      puts "Lives left: #{@turns}"
      
      guess = @player.make_guess
      if guess.downcase == 'exit'
        puts "Exiting game. Your progress is saved."
        GameSerializer.save(GameSave.new(self))
        return
      end

      guess_loop(guess)

      loop do 
        puts 'Do you want to save your game? (y/n)'
        answer = gets.chomp.downcase
        if answer == 'y'
        GameSerializer.save(GameSave.new(self)) 
        puts 'You successfully saved the game!'
        break
        elsif answer == 'n'
          break
        else
          puts 'Enter "y" or "n"'
        end
      end
    end
    show_feedback
  end

  def guess_loop(guess)
    if @secret_word.include?(guess)
      @secret_word.chars.each_with_index do |letter, position| 
        if letter == guess
          @blank_word[position] = guess
        end
      end
      puts "You've guessed the letter! #{@blank_word.join('')}"
    else 
      @turns -= 1
      puts "Icorrect! Your remaining lives #{@turns}"
    end
  end

  def show_feedback
    if @blank_word.join('') == @secret_word
      puts "Congrats! You've guessed the word #{@secret_word}"
    else
      puts "You lost! The secret word was #{@secret_word}"
    end
    return
  end
end