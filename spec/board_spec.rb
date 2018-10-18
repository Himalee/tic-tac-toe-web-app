require "./models/board.rb"

describe Board do
  describe "#tie?()" do
    it "returns false given empty board" do
      grid = Array.new(9, "")
      board = Board.new(grid)
      expect(board.tie?("O", "X")).to be false
    end

    it "returns false given fully marked board with a win" do
      grid = ["X", "X", "X", "O", "X", "O", "O", "X", "O"]
      board = Board.new(grid)
      expect(board.tie?("X", "O")).to be false
    end

    it "returns true given marked board with no win" do
      grid = ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
      board = Board.new(grid)
      expect(board.tie?("O", "X")).to be true
    end
  end

  describe "#win?()" do
    it "returns false given board with no win" do
      grid = ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
      board = Board.new(grid)
      expect(board.win?).to be false
    end

    it "returns true given board with a win - row" do
      grid = ["X", "X", "X", "", "", "", "", "", ""]
      board = Board.new(grid)
      expect(board.win?).to be true
    end

    it "returns true given board with a win - column" do
      grid = ["X", "", "", "X", "", "", "X", "", ""]
      board = Board.new(grid)
      expect(board.win?).to be true
    end

    it "returns true given board with a win - diagonal" do
      grid = ["X", "", "", "", "X", "", "", "", "X"]
      board = Board.new(grid)
      expect(board.win?).to be true
    end
  end

  describe "#end_of_game?()" do
    it "returns false give a non end of game state" do
      grid = Array.new(9, "")
      board = Board.new(grid)
      expect(board.end_of_game?("X", "O")).to be false
    end
  end

  describe "#winning_mark()" do
    it "returns winning mark 'X'" do
      grid = ["X", "X", "X", "", "", "", "", "", ""]
      board = Board.new(grid)
      expect(board.winning_mark).to eql("X")
    end

    it "returns nil winning mark" do
      grid = ["X", "", "", "", "", "", "", "", ""]
      board = Board.new(grid)
      expect(board.winning_mark).to eql(nil)
    end
  end
end
