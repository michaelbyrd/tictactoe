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

  def test_board_knows_marked_squares
    array = Array.new(7, " ")
    array << "X"
    array << "O"
    board = Board.new(array)
    assert_equal 2, board.marked_squares
  end

  def test_board_can_be_marked
    board = Board.new
    board.mark(0, "X")
    assert_equal 1, board.marked_squares
  end
end
