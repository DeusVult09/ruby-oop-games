
class Mastermind
  attr_reader :secret_code

  def initialize
    @colors = ['RED'.red, 'BLUE'.blue, 'GREEN'.green, 'YELLOW'.yellow]
    @secret_code = []
  end

  def generate_code
    @secret_code = Array.new(4) { @colors.sample }
  end
end