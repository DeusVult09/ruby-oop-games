
class Player
  attr_accessor :guess_letter

  def initialize(name)
    @guess_letter = ''
  end

  def make_guess
    puts 'Enter your guess letter:'
    input = gets.chomp.downcase
    @guess_letter << input
    input
  end
end