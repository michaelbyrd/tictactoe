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
    welcome
    until is_over?
      player_turn(@players[@switch])
      display
    end
  end

  def player_turn(player)
    if player.class == HumanPlayer
      puts "##            Your turn             ##"
    else
      puts "##      The Computer's turn         ##"
    end
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
        puts "The #{winner.class} has won!"
      end
      display
      exit
    end
  end

  private def display
    @board.display
    blank
    line
    blank
  end

  private def winner
    @players.select { |p| p.has_won? }[0]
  end

  private def blank
    puts "##                                  ##"
  end

  private def line
    puts "######################################"
  end

  private def welcome
    puts "######################################"
    puts "##                                  ##"
    puts "##      Welcome to Tic-Tac-Toe      ##"
    puts "##                                  ##"
    puts "##  To mark a square, simply enter  ##"
    puts "##  one of the numbers below.       ##"
    puts "##                                  ##"
    puts "##            |7|0|5|               ##"
    puts "##            |2|4|6|               ##"
    puts "##            |3|8|1|               ##"
    puts "##                                  ##"
    puts "##           Good Luck!             ##"
    puts "##       Thanks for playing         ##"
    puts "##                                  ##"
    puts "######################################"
  end
end

Game.new.play_round
