require 'minitest/autorun'
require 'minitest/pride'
require '../player.rb'

class PlayerTest < Minitest::Test

  def test_player_class_exist
    assert Player
  end
end
