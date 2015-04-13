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
    board.mark([0, "X"])
    assert_equal 1, board.marked_squares
  end

  def test_same_square_cant_be_marked_twice
    board = Board.new
    board.mark([0, "X"])
    assert_equal 1, board.marked_squares
    refute board.mark([0,"O"])
    assert board.mark([1,"O"])
  end

  def test_board_can_have_winner
    board = Board.new
    assert_equal false, board.is_won?
  end

  def test_board_can_win_with_a_row
    array = Array.new(6, " ")
    array += ["X","X","X"]
    board = Board.new(array)
    assert_equal true, board.is_won?
  end

  def test_board_can_win_with_a_column
    array = Array.new
    3.times { array += [" ", " ", "O"]}
    board = Board.new(array)
    assert_equal true, board.is_won?
  end

  def test_board_can_win_with_a_diagonal
    array = ["X", "O", " ",
             "O", "X", " ",
             " ", "O", "X"]
    board = Board.new(array)
    assert_equal true, board.is_won?
  end
end
