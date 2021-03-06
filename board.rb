class Board
  attr_accessor :squares
  def initialize
    @squares = Array.new(9, false)
    @open = (0..8).to_a
  end

  def mark(player, position)
    if @squares[position]
      false
    else
      @squares[position] = player
      @open[position] = nil
    end
  end

  def open_squares
    @open.compact
  end

  def data
    [@squares[7], @squares[0], @squares[5],
    @squares[2], @squares[4], @squares[6],
    @squares[3], @squares[8], @squares[1]]
  end

  def display
    d = data
    puts "##                                  ##"
    row(write(d[0]), write(d[1]), write(d[2]))
    row(write(d[3]), write(d[4]), write(d[5]))
    row(write(d[6]), write(d[7]), write(d[8]))
  end

  private def row(a,b,c)
    puts "##             |#{a}|#{b}|#{c}|              ##"
  end

  private def write(position)
    position ? position : " "
  end
end
