require './player'
require './board'

# the magic square
# all possible wins sum to 12

# # # # #
# 7 0 5 #
# 2 4 6 #
# 3 8 1 #
# # # # #

class Game
  attr_accessor :board, :players

  def initialize
    @board = Board.new
    @players = [ HumanPlayer.new(@board), ComputerPlayer.new(@board) ]
    @switch = [ 0, 1 ].sample
    @players[@switch].symbol = "X"
    @count = 0
  end

  def play_round
    until is_over?
      player_turn(@players[@switch])
      display
    end
  end

  def player_turn(player)
    puts "--- #{player.class} ---"
    mark = player.take_turn(@players[@switch - 1])
    @board.mark(@switch, mark)
    @switch = 1 - @switch
    @count += 1
  end

  def is_over?
    if winner || @count >= 9
      if winner.class == NilClass
        puts "It's a tie!"
      else
        puts "#{winner.class} has won!"
      end
      display
      exit
    end
  end

  private def display
    @board.display
  end

  private def winner
    @players.select { |p| p.has_won? }[0]
  end
end


puts "|7|0|5|"
puts "|2|4|6|"
puts "|3|8|1|"

Game.new.play_round
