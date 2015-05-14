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

  def best_move(opponent)
    # if I can win this turn, make that move
    return winning_moves if winning_moves
    # if my opponent can win, block that move
    return opponent.winning_moves if opponent.winning_moves
    # take the center square if it is available
    return 4 if open_squares.include?(4)
    # take a corner square if it is available
    return corners.sample unless corners.empty?
    # take whatever is free
    return open_squares.sample
  end

  private def corners
    [7,5,3,1] & open_squares
  end

  def take_turn(opponent)
    mark = best_move(opponent)
    if open_squares.include?(mark)
      record(mark)
      mark
    else
      take_turn(opponent)
    end
  end
end
