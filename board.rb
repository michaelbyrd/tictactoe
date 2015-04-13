class Board
  def initialize(squares = Array.new(9, " "))
    @squares = squares
  end

  def is_full?
    marked_squares == 9
  end

  def marked_squares
    @squares.select { |s| s != " " }.length
  end
end
