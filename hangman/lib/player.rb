
class Player
  attr_accessor :score, :guess_word
  attr_reader :name

  def initialize(name)
    @name = name
    @score = 0
    @guess_word = ''
  end

  def make_guess
    puts 'Enter your guess letter:'
    input = gets.chomp.downcase
    @guess_word << input
  end
end