class Player
  attr_reader :name, :selectio

  def initialize(name, selection)
    @name = name
    @selection = selection
  end
end