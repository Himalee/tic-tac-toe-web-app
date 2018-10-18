class GameFactory

HumanvsHuman = "Human vs Human"
HumanvsComputer = "Human vs Computer"

  def game(game_mode)
    if game_mode == HumanvsHuman
      players = [HumanPlayer.new("X"), HumanPlayer.new("O")]
      Game.new(new_board, players)
    elsif game_mode == HumanvsComputer
      players = [HumanPlayer.new("X"), ComputerPlayer.new("O")]
      Game.new(new_board, players)
    end
  end

  def new_board
    Board.new(Array.new(9, ""))
  end
end
