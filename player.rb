class Player
  attr_accessor :symbol
  def initialize(human)
    @squares = Array.new(9, false)
    @pairs = Array.new(11, false)
    @symbol = "O"
    @winner = false
  end

  def record(index)
    @squares[index] = true
    @squares.each_with_index do |s, i|
      @pairs[ index + i ] = true if s
    end
    @winner = true if @pairs[ 12 - index ]
  end

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
    rand(0..8)
  end
end
