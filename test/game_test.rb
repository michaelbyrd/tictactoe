require 'minitest/autorun'
require 'minitest/pride'
require './game.rb'

class GameTest < Minitest::Test

  def test_game_class_exist
    assert Game
  end

  def test_game_has_a_board
    game = Game.new
    assert game.board
  end

  def test_game_has_two_players
    game = Game.new
    assert_equal 2, game.players.length
  end
end
