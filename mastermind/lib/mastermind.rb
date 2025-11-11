
class Mastermind
  attr_reader :secret_code

  def initialize
    @colors = ['RED', 'BLUE', 'GREEN', 'YELLOW']
    @secret_code = []
  end

  def generate_code
    @secret_code = Array.new(4) { @colors.sample }
    puts @secret_code.map { |c| c.colorize(c.downcase.to_sym) }.join(' ')
  end
end