class Board
  def initialize(squares = Array.new(9, " "))
    @squares = squares
  end

  def is_full?
    marked_squares == 9
  end

  def mark(array)
    index = array[0]
    symbol = array[1]
    @squares[index] = symbol unless self.is_marked?(index)
  end

  def is_marked?(index)
    @squares[index] != " "
  end

  def marked_squares
    @squares.select { |s| s != " " }.length
  end

  def is_won?
    column_win || row_win || diagonal_win
  end

  private def column_win
    false
  end

  private def row_win
    false
  end

  private def diagonal_win
    false
  end
end
