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
    # rand(1..9)
    [3,8,1].sample + 1
  end
end
