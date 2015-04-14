class Player
  attr_accessor :symbol
  def initialize
    @squares = Array.new(10, false)
    @pairs = Array.new(11, false)
    @symbol = "O"
    @winner = false
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

  def winning_moves
    moves = @squares.map.with_index { |square, i| i if @pairs[ 15 - i ]}
    moves.select {|m| !m.nil? }
  end

  def has_won?
    @winner
  end

end

class HumanPlayer < Player
  def take_turn(other)
    gets.chomp.to_i
  end
end

class ComputerPlayer < Player
  def take_turn(other)
    if winning_moves.length > 0
      winnging_moves.sample
    elsif other.winning_moves.length > 0
      other.winning_moves[0]
    else
      rand(0..9)
    end
  end
end
