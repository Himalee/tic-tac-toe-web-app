class Negamax

  def get_best_move(board, depth=0, best_score={}, mark, player_one_mark, player_two_mark)
    return 0 if board.tie?(player_one_mark, player_two_mark)
    return -1 if board.win?
    board.available_spaces(player_one_mark, player_two_mark).each do |cell|
      new_board = board.new_board(cell, mark)
      opponent_mark = get_opponent_mark(mark, player_one_mark, player_two_mark)
      best_score[cell] = -1 * get_best_move(new_board, depth + 1, {}, opponent_mark, player_one_mark, player_two_mark)
    end
    best_move = best_score.max_by { |key, value| value }[0]
    highest_minimax_score = best_score.max_by { |key, value| value }[1]
    if depth == 0
      return best_move
    elsif depth > 0
      return highest_minimax_score
    end
  end

  private

  def get_opponent_mark(mark, player_one_mark, player_two_mark)
    if mark == player_one_mark
      player_two_mark
    else
      player_one_mark
    end
  end
end
