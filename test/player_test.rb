require 'minitest/autorun'
require 'minitest/pride'
require './player.rb'

class PlayerTest < Minitest::Test

  def test_player_class_exist
    assert Player
  end

  def test_player_can_be_human_or_computer
    me = Player.new(true)
    hal = Player.new(false)
    assert_equal true, me.is_human?
    assert_equal false, hal.is_human?
  end
end
