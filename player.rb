class Player
  def initialize(human)
    @human = human
  end

  def is_human?
    @human
  end

  def take_turn
    rand(0..8)
  end

  def symbol
    @human ? "X" : "O"
  end
end
