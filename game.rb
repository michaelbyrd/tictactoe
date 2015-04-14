require './player'

# # # # #
# 7 0 5 #
# 2 4 6 #
# 3 8 1 #
# # # # #

class Game
  attr_accessor :board, :players

  def initialize
    @board = Array.new(9, false)
    @players = [ Player.new(true), Player.new(false) ]
    @switch = [ 0, 1 ].sample
    @count = 0
  end

  def play_round
    until is_over?
      player_turn(@players[@switch])
    end
  end

  def player_turn(player)
    mark = player.take_turn
    if @board[mark]
      player_turn(player)
    else
      @board[mark] = @switch
      player.record(mark)
      check_win(player, mark)
      @switch = 1 - @switch
      @count += 1
    end
  end

  def is_over?
    @count >= 9 || @players.any? { |p| p.is_winner? }
  end

  private def check_win(player, index)
    player.check_win(index)
  end

end
