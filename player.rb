class Player
  # attr_accessor :squares, :pairs
  def initialize(human)
    @human = human
    @squares = Array.new(9, false)
    @pairs = Array.new(11, false)
  end

  def record(index)
    @squares[index] = true
    @squares.each_with_index do |s, i|
      @pairs[ index + i ] = true if s
    end
  end

  def is_human?
    @human
  end

  def take_turn(board)
    [ @human ? human_turn : computer_turn(board) , symbol ]
  end

  def symbol
    @human ? "X" : "O"
  end

  private def human_turn
    gets.chomp.to_i
  end

  private def computer_turn(board)
    array = board.squares
    if board.marked_squares < 2
      if array[4] == " "
        4
      else
        0
      end
    else
      rand(0..8)
    end
  end
end
