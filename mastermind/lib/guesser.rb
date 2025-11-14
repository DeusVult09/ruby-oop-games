class Codebreaker
  attr_accessor :name, :guess_code

  def initialize(name)
    @name = name
    @guess_code = []
  end

  def human_guess
    input = gets.chomp.upcase
    @guess_code = input.split(',').map(&:strip)
  end

  def computer_guess
    colors = ['RED', 'BLUE', 'GREEN', 'YELLOW']
    @guess_code = Array.new(4) { colors.sample }
    puts "Computer guesses: #{@guess_code.join(', ')}"
  end
end