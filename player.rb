class Player
  def initialize(human)
    @human = human
  end

  def is_human?
    @human
  end

  def take_turn
    if @human
      human_turn
    else
      computer_turn
    end
  end

  def symbol
    @human ? "X" : "O"
  end

  private def human_turn
    rand(0..8)
  end

  private def computer_turn
    rand(0..8)
  end
end
