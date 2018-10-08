class Board

  FIRST_ELEMENT = 0
  ONE_LEVEL = 1

  def initialize()
    @size = 3
  end

  def store_grid(grid)
    hash = { "grid" => grid }
    File.open("./public/grid.json", "w") do |file|
      file.write(hash.to_json)
    end
  end

  def get_grid
    file = File.read("./public/grid.json")
    data_hash = JSON.parse(file)
    data_hash["grid"]
  end

  def get_mark(grid)
    if grid.count("X") == 0 && grid.count("O") == 0
      mark = "X"
    elsif grid.count("X") == grid.count("O")
      mark = "X"
    else
      mark = "O"
    end
    mark
  end

  def result(grid)
    if tie?(grid, "X", "O")
      "Draw"
    elsif win?(grid)
      "Game over"
    end
  end

  def end_of_game?(grid, player_one_mark, player_two_mark)
    tie?(grid, player_one_mark, player_two_mark) || win?(grid)
  end

  def tie?(grid, player_one_mark, player_two_mark)
    grid.all? { |cell| cell == player_one_mark || cell == player_two_mark }
  end

  def win?(grid)
    all_winning_combinations(grid).any? {|line| line.uniq.length == 1 && !line.include?("")}
  end

  def store_marked_grid(grid, cell, mark)
    new_grid = mark_grid(grid, cell, mark)
    store_grid(new_grid)
  end

  private

  def mark_grid(grid, cell, mark)
    grid[cell] = mark
    grid
  end

  def all_winning_combinations(grid)
    [winning_rows(grid), winning_columns(grid), winning_diagonals(grid)].flatten(ONE_LEVEL)
  end

  def winning_columns(grid)
    winning_rows(grid).transpose
  end

  def winning_rows(grid)
    grid.each_slice(@size).to_a
  end

  def winning_diagonals(grid)
    [diagonal_line(grid, FIRST_ELEMENT, @size + 1), diagonal_line(grid, @size - 1, @size - 1)]
  end

  def diagonal_line(grid, first_index, increase_index_by)
    diagonal = []
    index = first_index
    until diagonal.count == @size
      diagonal << grid[index]
      index += increase_index_by
    end
    diagonal
  end
end
