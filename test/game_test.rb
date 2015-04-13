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
    assert_equal true, game.players[0].is_human?
    assert_equal false, game.players[1].is_human?
  end

  def test_players_can_take_thier_turns
    10.times do
      game = Game.new
      game.play_round
      assert_equal 2, game.marked_squares
    end
  end

  def test_game_is_over_after_nine_turns
    game = Game.new
    4.times { game.play_round }
    refute game.play_round
  end
end
