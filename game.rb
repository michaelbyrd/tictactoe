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
    @players[@switch].symbol = "X"
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
      @switch = 1 - @switch
      @count += 1
    end
  end

  def is_over?
    winner || @count >= 9
  end

  private def winner
    @players.select { |p| p.has_won? }[0]
  end

end
