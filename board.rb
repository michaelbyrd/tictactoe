class Board
  def initialize(squares = Array.new(9, " "))
    @squares = squares
  end

  def is_full?
    @squares.all? { |s| s != " " }
  end
end
