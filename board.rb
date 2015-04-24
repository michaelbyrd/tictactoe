class Board
  attr_accessor :squares
  def initialize
    @squares = Array.new(9, false)
  end

  def mark(player, position)
    if @squares[position]
      false
    else
      @squares[position] = player
    end
  end

  def open_squares
    @squares.map.with_index{ |s,i| s ? nil  : i }.compact
  end

  def best_moves(player)

  end

  def data
    [@squares[7], @squares[0], @squares[5],
    @squares[2], @squares[4], @squares[6],
    @squares[3], @squares[8], @squares[1]]
  end

  def display
    d = data
    puts "|#{write(d[0])}|#{write(d[1])}|#{write(d[2])}|"
    puts "|#{write(d[3])}|#{write(d[4])}|#{write(d[5])}|"
    puts "|#{write(d[6])}|#{write(d[7])}|#{write(d[8])}|"
  end

  private def write(position)
    position ? position : " " #@players[position].symbol : " "
  end
end
