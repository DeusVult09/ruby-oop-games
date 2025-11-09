require_relative 'guesser' 
require 'colorize'

class Board
  attr_accessor :guess_code
  attr_reader :secret_code

  def initialize
    @colors = ['RED'.red, 'BLUE'.blue, 'GREEN'.green, 'YELLOW'.yellow]
    @secret_code = Array.new
  end

  def generate_code
    @secret_code = Array.new(@colors.length) { @colors.sample }
  end

  def guess_code
    puts "Dear, #{@name}, you need to guess color combinations secretly written by the computer."
    @guess_code = gets.chomp.upcase.chars
  end

  def feedback
    @reds = 0
    @whites = 0

    @copy_secret = @secret_code.clone
    @copy_guess = @guess_code.clone

    4.times do |i|
      if @copy_secret[i] == @copy_guess[i]
        @reds += 1
        @copy_secret[i] = '❌'
        @copy_guess[i]  = '❌'
      end
    end
    4.times do |i|
      next if @copy_guess[i] == '❌'
      index = @copy_secret.find_index(@copy_guess[i])
      if index 
        @whites += 1
        @copy_secret[index] = '❌'       
      end
    end 
    puts "RED PEGS: #{@reds}, WHITE PEGS: #{@whites}"
  end
end