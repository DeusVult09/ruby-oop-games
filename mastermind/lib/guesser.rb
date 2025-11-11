class Codebreaker
  attr_accessor :name, :guess_code

  def initialize(name)
    @name = name
    @guess_code = []
  end

  def decode
    input = gets.chomp.upcase
    @guess_code = input.split(',').map(&:strip)
  end
end