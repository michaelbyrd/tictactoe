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
      player_turn(p)
    end
  end

  def player_turn(player)
    mark = player.take_turn
    if @board.is_marked?(mark)
      player_turn(player)
    else
      @board.mark(mark, "X")
    end

  end

  def marked_squares
    @board.marked_squares
  end

  def is_over?
    false
  end

end
