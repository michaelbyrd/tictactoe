class Player
  attr_accessor :symbol
  def initialize(human)
    @squares = Array.new(9, false)
    @pairs = Array.new(11, false)

    @human = human
    @symbol = nil
    @winner = false
  end

  def record(index)
    @squares[index] = true
    @squares.each_with_index do |s, i|
      @pairs[ index + i ] = true if s
    end

    check_win(index)
  end

  def check_win(index)
    @winner = true if @pairs[11-index]
  end

  def is_human?
    @human
  end

  def has_won?
    @winner
  end

  def take_turn
    @human ? human_turn : computer_turn
  end

  def symbol
    @symbol || "O"
  end

  private def human_turn
    gets.chomp.to_i
  end

  private def computer_turn
    rand(0..8)
  end
end
