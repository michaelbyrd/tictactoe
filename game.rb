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
      player_turn(p) unless self.is_over?
      return false if self.is_over? # FIXME
    end
  end

  def player_turn(player)
    mark = player.take_turn
    if @board.is_marked?(mark[0])
      player_turn(player)
    else
      @board.mark(mark)
    end
  end

  def marked_squares
    @board.marked_squares
  end

  def is_over?
    @board.is_full? || false
  end

end
