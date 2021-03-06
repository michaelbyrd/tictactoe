class Player
  attr_accessor :symbol
  def initialize(board)
    @board = board
    @my_moves = []
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

  private def first?
    open_squares.length.odd?
  end

  def best_move(opponent)
    # if I can win this turn, make that move
    return winning_moves if winning_moves
    # if my opponent can win, block that move
    return opponent.winning_moves if opponent.winning_moves
    # take the center square if it is available
    return 4 if open_squares.include?(4)
    # take an edge square if it is abailable
    return edges.sample unless edges.empty?
    # take a corner square if it is available
    return corners.sample unless corners.empty?
    # take whatever is free
    return open_squares.sample
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

  private def corners
    [7,5,3,1] & open_squares
  end

  private def edges
    [0,2,6,8] & open_squares
  end
end
