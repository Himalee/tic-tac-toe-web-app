require "./models/player.rb"
require "./models/computer_player.rb"

describe ComputerPlayer do

  let :computer_player { ComputerPlayer.new("X") }

  it "returns name" do
    expect(computer_player.name).to eql("Computer Player")
  end

  it "returns mark" do
    expect(computer_player.mark).to eql("X")
  end
end
