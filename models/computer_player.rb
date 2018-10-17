class ComputerPlayer < Player

  def name
    "Computer Player"
  end

  def get_move(board, player_one_mark, player_two_mark)
    Negamax.new.get_best_move(board, self.mark, player_one_mark, player_two_mark)
  end
end
