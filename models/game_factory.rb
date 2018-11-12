class GameFactory

HumanvsHuman = "Human vs Human"
HumanvsComputer = "Human vs Computer"

  def game(game_mode)
    if game_mode == HumanvsHuman
      players = [HumanPlayer.new("🌝"), HumanPlayer.new("🌚")]
      Game.new(new_board, players)
    elsif game_mode == HumanvsComputer
      players = [HumanPlayer.new("🌝"), ComputerPlayer.new("🌚")]
      Game.new(new_board, players)
    end
  end

  def new_board
    Board.new(Array.new(9, ""))
  end
end
