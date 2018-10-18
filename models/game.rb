class Game

  ComputerPlayer = "Computer Player"

  attr_reader :players

  def initialize(board, players)
    @board = board
    @players = players
  end

  def get_grid
    @board.grid
  end

  def play_turn(human_move)
    play_human_move(human_move)
    if current_player.name == ComputerPlayer
      play_computer_move
    end
  end

  def end_of_game?
    @board.end_of_game?(current_player.mark, opponent.mark)
  end

  def result
    if @board.tie?(current_player.mark, opponent.mark)
      "Draw"
    else
      "Player #{@board.winning_mark} wins"
    end
  end

  private

  def play_human_move(move)
    @board = @board.new_board(move, current_player.mark)
    next_player
  end

  def play_computer_move
    @board = @board.new_board(current_player.get_move(@board, current_player.mark, opponent.mark), current_player.mark)
    next_player
  end

  def current_player
    @players[0]
  end

  def opponent
    @players[1]
  end

  def next_player
    @players.rotate!
  end
end
