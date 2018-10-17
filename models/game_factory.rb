class GameFactory

  def game(game_mode)
    if game_mode == "Human vs Human"
      players = [HumanPlayer.new("X"), HumanPlayer.new("O")]
      Game.new(new_board, players)
    elsif game_mode == "Human vs Computer"
      players = [HumanPlayer.new("X"), ComputerPlayer.new("O")]
      Game.new(new_board, players)
    end
  end

  def new_board
    Board.new(Array.new(9, ""))
  end
end
