class Game

  def initialize(board)
    @board = board
  end

  def get_grid
    @board.grid
  end

  def play_move(move)
    @board = @board.new_board(move, get_mark)
  end

  def end_of_game?
    @board.end_of_game?("X", "O")
  end

  def result
    if @board.tie?("X", "O")
      "Draw"
    else
      "Game over"
    end
  end

  private

  def get_mark
    if @board.grid.count("X") == 0 && @board.grid.count("O") == 0
      mark = "X"
    elsif @board.grid.count("X") == @board.grid.count("O")
      mark = "X"
    else
      mark = "O"
    end
    mark
  end
end
