class Player
  attr_accessor :symbol, :squares
  def initialize
    @squares = Array.new(10, false)
    @pairs = Array.new(11, false)
    @symbol = "O"
    @winner = false
  end

  def has_won?
    @winner
  end

  def record(mark)
    @squares[mark] = true
    @squares.each_with_index do |square, index|
      if square && mark + index < 15 && index != mark # TODO figure this out
        @pairs[ mark + index ] = true
      end
    end
    @winner = true if @pairs[ 15 - mark ]
  end

  private def possible_moves
    moves = @squares.map.with_index { |square, i| i if @pairs[ 15 - i ]}
    moves.reject {|m| m.nil? }
  end

  def winning_moves(other)
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
    mine = winning_moves(other)[0]
    theirs = other.winning_moves(self)[0]
    mine || theirs || rand(0..9)
  end
end
