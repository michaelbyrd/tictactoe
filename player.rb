class Player
  def initialize(human)
    @human = human
  end

  def is_human?
    @human
  end

  def take_turn(board)
    [ @human ? human_turn : computer_turn(board) , symbol ]
  end

  def symbol
    @human ? "X" : "O"
  end

  private def human_turn
    gets.chomp.to_i
  end

  private def computer_turn(board)
    array = board.squares
    if board.marked_squares < 2
      if array[4] == " "
        4
      else
        0
      end
    else
      rand(0..8)
  end
end
