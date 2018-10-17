require "./models/game_factory.rb"

describe GameFactory do
  context "given a human vs human game mode" do

    before :each do
      game_mode = "Human vs Human"
      @new_game = GameFactory.new.game(game_mode)
    end

    it "returns 2 human players" do
      expect(@new_game.players[0]).to be_a(HumanPlayer)
      expect(@new_game.players[1]).to be_a(HumanPlayer)
    end

    it "returns a new game" do
      expect(@new_game).to be_a(Game)
    end
  end

  context "given a human vs computer game mode" do

    before :each do
      game_mode = "Human vs Computer"
      @new_game = GameFactory.new.game(game_mode)
    end

    it "returns 1 human player and 1 computer player" do
      expect(@new_game.players[0]).to be_a(HumanPlayer)
      expect(@new_game.players[1]).to be_a(ComputerPlayer)
    end
  end
end

