class Codebreaker
  attr_accessor :name, :guess_code

  def initialize(name)
    @name = name
    @guess_code = []
  end

  def guess_code
    puts "Dear, #{@name}, you need to guess color combinations secretly written by the computer."
    @guess_code = gets.chomp.upcase.chars
  end
end