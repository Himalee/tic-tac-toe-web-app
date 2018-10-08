class Board

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


  def store_marked_grid(grid, cell, mark)
    new_grid = mark_grid(grid, cell, mark)
    store_grid(new_grid)
  end

  private

  def mark_grid(grid, cell, mark)
    grid[cell] = mark
    grid
  end
end
