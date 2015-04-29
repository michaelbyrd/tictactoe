class Player
  attr_accessor :symbol, :pairs
  def initialize(board)
    @board = board
    @pairs = Array.new(12, nil)
    @my_moves = []
    @winning_moves = []
    @symbol = "O"
    @winner = false
  end

  def has_won?
    @winner
  end

  def record(mark)
    @my_moves.each do |m|
      @pairs[mark + m] = true if mark + m < 12 && mark + m > 3
    end
    @winner = true if winning_moves.include?(mark)
    @my_moves << mark
  end

  private def winning_moves
    moves = @pairs.map.with_index { |p,i| 12 - i if p }
    moves.select { |m| open_squares.include?(m) }
  end

  private def open_squares
    @board.open_squares
  end

end

class HumanPlayer < Player
  def take_turn
    print open_squares
    puts ""
    mark = gets.chomp.to_i
    if open_squares.include?(mark)
      record(mark)
      mark
    else
      take_turn
    end
  end
end

class ComputerPlayer < Player
  def take_turn
    print @pairs
    puts ""
    print "winnning:"
    print winning_moves
    puts ""
    print "open:"
    print open_squares
    puts ""
    if winning_moves.empty?
      mark = rand(0..9)
    else
      mark = winning_moves.sample
    end
    puts "mark: #{mark}"

    if open_squares.include?(mark)
      record(mark)
      mark
    else
      take_turn
    end
  end
end
