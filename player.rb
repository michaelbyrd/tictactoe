class Player
  attr_accessor :symbol
  def initialize
    @squares = Array.new(10, false)
    @pairs = Array.new(11, false)
    @symbol = "O"
    @winner = false
  end

  def record(index)
    @squares[index] = true
    @squares.each_with_index do |square, i|
      if square && index + i < 15 && i != index # TODO figure this out
        @pairs[ index + i ] = true
      end
    end
    @winner = true if @pairs[ 15 - index ]
  end

  # def winning_moves
  #   @squares.map.with_index do |square, i|
  #
  #   end
  # end

  def has_won?
    @winner
  end

end

class HumanPlayer < Player
  def take_turn
    gets.chomp.to_i
  end
end

class ComputerPlayer < Player
  def take_turn
    # rand(0..8)
    [3,8,1].sample + 1
  end
end
