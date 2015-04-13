require 'minitest/autorun'
require 'minitest/pride'
require '../board.rb'

class BoardTest < Minitest::Test

  def test_board_class_exist
    assert Board
  end

  def test_knows_if_full
    board = Board.new
    assert_equal false, board.is_full?
  end
end
