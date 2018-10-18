require './models/negamax.rb'

describe Negamax do

  before :each do
    @negamax = Negamax.new
  end

  context "'X' move: returns cell given grid with" do
    it "one move left" do
      grid = ["X", "O", "X", "O", "O", "X", "X", "", "O"]
      board = Board.new(grid)
      expect(@negamax.get_best_move(board, "X", "X", "O")).to eql(7)
    end

    it "three moves left" do
     grid = ["O", "X", "", "X", "X", "", "", "O", "O"]
     board = Board.new(grid)
     expect(@negamax.get_best_move(board, "X", "O", "X")).to eql(5)
   end

   it "five moves left" do
      grid = ["O", "X", "", "", "", "", "", "X", "O"]
      board = Board.new(grid)
      expect(@negamax.get_best_move(board, "X", "O", "X")).to eql(4)
    end

    it "five moves left - trap move" do
      grid = ["O", "", "", "", "X", "O", "", "", "X"]
      board = Board.new(grid)
      expect(@negamax.get_best_move(board, "X", "O", "X")).to eql(2).or(eq(6))
    end
  end

  context "'O' move: returns cell given grid with" do
    it "five moves left - stops opponent from winning" do
      grid = ["X", "", "X", "", "O", "O", "", "", ""]
      board = Board.new(grid)
      expect(@negamax.get_best_move(board, "O", "X", "O")).to eql(1)
    end
   end
end
