require 'minitest/autorun'
require 'minitest/pride'
require './game.rb'

class GameTest < Minitest::Test

  def test_game_class_exist
    assert Game
  end
end
