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
    @my_moves.combination(3).detect { |a, b, c| a + b + c == 12 }
  end

  def record(mark)
    @my_moves << mark
  end

  def winning_moves
    moves = @my_moves.combination(2).detect { |a, b| open_squares.include?( 12 - (a + b )) }
    12 - moves.inject(:+) if moves
  end

  private def open_squares
    @board.open_squares
  end

end

class HumanPlayer < Player
  def take_turn(opponent)
    puts winning_moves
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
    if winning_moves
      mark = winning_moves
    elsif opponent.winning_moves
      mark = opponent.winning_moves
    else
      mark = rand(0..9)
    end
    if open_squares.include?(mark)
      record(mark)
      mark
    else
      take_turn(opponent)
    end
  end
end
