require "board"

describe Board do
  describe "#tie?()" do
    it "returns false given empty board" do
      grid = Array.new(9, "")
      board = Board.new
      expect(board.tie?(grid, "O", "X")).to be false
    end

    it "returns true given marked board with no win" do
      grid = ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
      board = Board.new
      expect(board.tie?(grid, "O", "X")).to be true
    end
  end

  describe "#win?()" do
    it "returns false given board with no win" do
      grid = ["X", "O", "X", "O", "X", "O", "O", "X", "O"]
      board = Board.new
      expect(board.win?(grid)).to be false
    end

    it "returns true given board with a win - row" do
      grid = ["X", "X", "X", "", "", "", "", "", ""]
      board = Board.new
      expect(board.win?(grid)).to be true
    end

    it "returns true given board with a win - column" do
      grid = ["X", "", "", "X", "", "", "X", "", ""]
      board = Board.new
      expect(board.win?(grid)).to be true
    end

    it "returns true given board with a win - diagonal" do
      grid = ["X", "", "", "", "X", "", "", "", "X"]
      board = Board.new
      expect(board.win?(grid)).to be true
    end
  end

  describe "#end_of_game?()" do
    it "returns false give a non end of game state" do
      grid = Array.new(9, "")
      board = Board.new
      expect(board.end_of_game?(grid, "X", "O")).to be false
    end
  end
end
