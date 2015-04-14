require './board'
require './player'

# # # # #
# 7 0 5 #
# 2 4 6 #
# 3 8 1 #
# # # # #

class Game
  attr_accessor :board, :players

  def initialize
    @board = Board.new
    @players = [ Player.new(true), Player.new(false) ]
    @switch = [ 0, 1 ].sample
  end

  def play_round
    display
    player_turn(@players[@switch]) unless self.is_over?
    return false if self.is_over? # FIXME
  end

  def player_turn(player)
    mark = player.take_turn
    if @board.is_marked?(mark[0])
      player_turn(player)
    else
      player.record(mark[0])
      @board.mark(mark)
      check_win(player, mark[0])
      @switch = 1 - @switch
    end
  end

  private def check_win(player, index)
    player.check_win(index)
  end

  def marked_squares
    @board.marked_squares
  end

  def is_over?
    @board.is_won? || @board.is_full? || false
  end

  def display
    @board.display
  end

end

# g = Game.new
# until g.is_over?
#   g.play_round
# end
