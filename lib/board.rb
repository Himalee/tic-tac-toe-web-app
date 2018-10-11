class Board

  FIRST_ELEMENT = 0
  ONE_LEVEL = 1

  attr_reader :grid, :max_number_of_cells, :size

  def initialize(grid)
    @grid = grid
    @size = 3
  end

  def end_of_game?(player_one_mark, player_two_mark)
    tie?(player_one_mark, player_two_mark) || win?
  end

  def tie?(player_one_mark, player_two_mark)
    !win? && @grid.all? { |cell| cell == player_one_mark || cell == player_two_mark }
  end

  def win?
    all_winning_combinations.any? {|line| line.uniq.length == 1 && !line.include?("")}
  end

  def mark_grid(grid, cell, mark)
    grid[cell] = mark
    grid
  end

  def new_board(cell, mark)
    current_grid = @grid.dup
    new_grid = mark_grid(current_grid, cell, mark)
    Board.new(new_grid)
  end

  def available_spaces(player_one_mark, player_two_mark)
    available_spaces = []
    @grid.each do |cell|
      if cell != player_one_mark && cell != player_two_mark
        available_spaces << cell
      end
    end
    available_spaces
  end

  def max_number_of_cells
    @size**2
  end

  private

  def all_winning_combinations
    [winning_rows, winning_columns, winning_diagonals].flatten(ONE_LEVEL)
  end

  def winning_columns
    winning_rows.transpose
  end

  def winning_rows
    @grid.each_slice(@size).to_a
  end

  def winning_diagonals
    [diagonal_line(FIRST_ELEMENT, @size + 1), diagonal_line(@size - 1, @size - 1)]
  end

  def diagonal_line(first_index, increase_index_by)
    diagonal = []
    index = first_index
    until diagonal.count == @size
      diagonal << @grid[index]
      index += increase_index_by
    end
    diagonal
  end
end
