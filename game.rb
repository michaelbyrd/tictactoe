require './board'
require './player'

class Game
  attr_accessor :board, :players

  def initialize
    @board = Board.new
    @players = [ Player.new(true), Player.new(false) ]
  end

  def play_round

  end

  def marked_squares
    @board.marked_squares
  end

end
