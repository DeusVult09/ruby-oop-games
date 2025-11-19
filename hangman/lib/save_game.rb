require_relative 'game'
require_relative 'player'

class GameSave
  attr_accessor :secret_word, :blank_word, :turns, :player, :player_guesses

  def initialize(game)
    @secret_word = game.secret_word
    @blank_word = game.blank_word
    @turns = game.turns
    @player = game.player
    @player_guesses = game.player.guess_letter
  end

  def load(game)
    game.secret_word = @secret_word
    game.blank_word = @blank_word
    game.turns = @turns
    game.player = @player
    game.player.guess_letter = @player_guesses || ''
  end
end