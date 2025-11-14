require 'colorize'

class Mastermind
  attr_reader :secret_code

  def initialize
    @colors = ['RED', 'BLUE', 'GREEN', 'YELLOW']
    @secret_code = []
  end

  def generate_code
    @secret_code = Array.new(4) { @colors.sample }
  end

  def set_code 
    puts "Enter your secret code (4 colors, separated by commas): "
    input = gets.chomp.upcase
    @secret_code = input.split(',').map(&:strip)
    puts secret_code.map { |c| c.colorize(c.downcase.to_sym) }.join(' ')
    puts "Your secret code has been set!"
  end
end