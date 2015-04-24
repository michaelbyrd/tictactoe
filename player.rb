class Player
  attr_accessor :symbol, :squares
  def initialize(board, position)
    @board = board
    @position = position
    # @squares = Array.new(9, false)
    @pairs = Array.new(12, false)
    @symbol = "O"
    @winner = false
  end

  def has_won?
    @winner
  end

  def record(mark)
    @board.each_with_index do |s, i |
      if s && mark + i < 12
        @pairs[ mark + i ] = true
      end
    end

    # @squares.each_with_index do |square, index|
    #   if square && mark + index < 15 # TODO figure this out
    #     @pairs[ mark + index ] = true
    #   end
    # end
    @board[mark] = @position

    @winner = true if @pairs[ 12 - mark ]
    if @winner
      puts "mark: #{mark}"
      puts ""
      print @board
      puts ""
      print @pairs
      puts ""
    end
  end

  private def possible_moves
    moves = @board.map.with_index { |square, i| i if @pairs[ 12 - i ]}
    moves.reject {|m| m.nil? }
  end

  protected def winning_moves(other)
    possible_moves.reject { |m| other.squares[m] }
  end
end

class HumanPlayer < Player
  def take_turn(other)
    gets.chomp.to_i
  end
end

class ComputerPlayer < Player
  def take_turn(other)
    mine = winning_moves(other)
    theirs = other.winning_moves(self)
    if mine.length > 0
      mine[0]
    elsif theirs.length > 0
      theirs[0]
    else
      rand(0..9)
    end
  end
end
