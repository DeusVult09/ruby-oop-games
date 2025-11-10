class Codebreaker
  attr_accessor :name, :guess_code

  def initialize(name)
    @name = name
    @guess_code = []
  end

  def decode
    @guess_code = gets.chomp.upcase.chars
  end
end