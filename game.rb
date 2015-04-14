require './player'

# the magic square #

# # # # #
# 7 0 5 #
# 2 4 6 #
# 3 8 1 #
# # # # #

class Game
  attr_accessor :board, :players

  def initialize
    @board = Array.new(9, false)
    @players = [ HumanPlayer.new(true), ComputerPlayer.new(false) ]
    @switch = 0 # [ 0, 1 ].sample
    @count = 0
  end

  def play_round
    @players[@switch].symbol = "X"
    until is_over?
      player = @players[@switch]
      puts "#{player.class} has won: #{player.has_won?}"
      puts "-----------"
      player_turn(@players[@switch])
      display
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
    if winner || @count >= 9
      puts "#{winner.class} has won!"
      print winner.squares
      puts "--"
      print winner.pairs
      puts "--"
      display
      exit
    end
  end

  private def winner
    @players.select { |p| p.has_won? }[0]
  end

  def data
    [write(@board[7]), write(@board[0]), write(@board[5]),
    write(@board[2]), write(@board[4]), write(@board[6]),
    write(@board[3]), write(@board[8]), write(@board[1])]
  end

  def display
    d = data
    puts "|#{d[0]}|#{d[1]}|#{d[2]}|"
    puts "|#{d[3]}|#{d[4]}|#{d[5]}|"
    puts "|#{d[6]}|#{d[7]}|#{d[8]}|"
  end

  private def write(square)
    square ? @players[square].symbol : " "
  end

end

puts "|7|0|5|"
puts "|2|4|6|"
puts "|3|8|1|"

Game.new.play_round
