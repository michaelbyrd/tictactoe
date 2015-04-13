require 'minitest/autorun'
require 'minitest/pride'
require './board.rb'

class BoardTest < Minitest::Test

  def test_board_class_exist
    assert Board
  end

  def test_new_board_is_not_full
    board = Board.new
    assert_equal false, board.is_full?
  end

  def test_full_board_is_full
    board = Board.new(Array.new(9, "X"))
    assert_equal true, board.is_full?
  end
end
