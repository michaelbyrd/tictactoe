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
    [write(@squares[7]), write(@squares[0]), write(@squares[5]),
    write(@squares[2]), write(@squares[4]), write(@squares[6]),
    write(@squares[3]), write(@squares[8]), write(@squares[1])]
  end

  def display
    d = data
    puts "|#{d[0]}|#{d[1]}|#{d[2]}|"
    puts "|#{d[3]}|#{d[4]}|#{d[5]}|"
    puts "|#{d[6]}|#{d[7]}|#{d[8]}|"
  end

  private def write(position)
    position ? position : " " #@players[position].symbol : " "
  end
end
