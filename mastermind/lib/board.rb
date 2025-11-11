require_relative 'guesser'
require 'colorize'

class Board
  attr_accessor :guess_code, :secret_code
  attr_reader :reds, :whites
  
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