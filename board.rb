class Board
  attr_reader :squares
  def initialize(squares = Array.new(9, " "))
    @squares = squares
  end

  def display
    s = @squares
    puts "|#{s[7]}|#{s[0]}|#{s[5]}|"
    puts "|#{s[2]}|#{s[4]}|#{s[6]}|"
    puts "|#{s[3]}|#{s[8]}|#{s[1]}|"
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
    columns.any? do |c|
      c.uniq.length == 1 && c.uniq[0] != " "
    end
  end

  private def row_win
    rows.any? do |r|
      r.uniq.length == 1 && r.uniq[0] != " "
    end
  end

  private def diagonal_win
    diagonals.any? do |d|
      d.uniq.length == 1 && d.uniq[0] != " "
    end
  end

  private def columns
    s = @squares
    [
      [s[0], s[3], s[6]],
      [s[1], s[4], s[7]],
      [s[2], s[5], s[8]]
    ]
  end

  private def rows
    [@squares[0..2],
     @squares[3..5],
     @squares[6..8]]
  end

  private def diagonals
    s = @squares
    [
      [s[0], s[4], s[8]],
      [s[2], s[4], s[6]]
    ]
  end
end
