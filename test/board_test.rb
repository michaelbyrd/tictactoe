require 'minitest/autorun'
require 'minitest/pride'
require '../board.rb'

class BoardTest < Minitest::Test

  def test_board_class_exist
    assert Board
  end
end
