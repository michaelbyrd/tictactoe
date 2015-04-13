require './board'
require './player'

class Game
  attr_accessor :board, :players

  def initialize
    @board = Board.new
    @players = [ Player.new(true), Player.new(false) ]
  end

  def play_round
    @players.each do |p|
      @board.mark(p.take_turn) unless self.is_over?
    end
  end

  def marked_squares
    @board.marked_squares
  end

  def is_over?
    false
  end

end
