
class Player
  attr_accessor :score, :guess_letter
  attr_reader :name

  def initialize(name)
    @name = name
    @score = 0
    @guess_letter = ''
  end

  def make_guess
    puts 'Enter your guess letter:'
    input = gets.chomp.downcase
    @guess_letter << input
  end
end