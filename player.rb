class Player
  attr_accessor :symbol, :pairs
  def initialize(board)
    @board = board
    @pairs = Array.new(12, nil)
    @my_moves = []
    @winning_moves = []
    @symbol = "O"
  end

  def has_won?
    # do any 3 of @my_moves sum to 12?
    @my_moves.combination(3).detect { |a, b, c| a + b + c == 12 }
  end

  def record(mark)
    @my_moves << mark
  end

  def winning_moves
    moves = @pairs.map.with_index { |p,i| 12 - i if p }
    moves.select { |m| open_squares.include?(m) }
  end

  private def open_squares
    @board.open_squares
  end

end

class HumanPlayer < Player
  def take_turn(opponent)
    mark = gets.chomp.to_i
    if open_squares.include?(mark)
      record(mark)
      mark
    else
      take_turn(opponent)
    end
  end
end

class ComputerPlayer < Player
  # if I can win this turn, make that move
  # if my opponent can win, block that move
  # take the center square if it is available
  # take a corner square if it is available
  # take whatever is free

  def take_turn(opponent)
      mark = rand(0..9)
    if open_squares.include?(mark)
      record(mark)
      mark
    else
      take_turn(opponent)
    end
  end
end
