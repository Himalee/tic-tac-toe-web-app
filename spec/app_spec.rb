ENV['RACK_ENV'] = 'test'

require './app.rb'
require 'rspec'
require 'rack/test'
require 'capybara/rspec'

describe 'The TicTacToe App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context "/" do
    it "returns status 200 OK" do
      response = get '/'
      expect(response.status).to eq 200
    end

    it "says Welcome to Tic Tac Toe" do
      get '/'
      expect(last_response.body).to include('Welcome to Tic Tac Toe')
    end
  end

  it "returns 'Welcome'" do
    Capybara.app = app
    visit "/"
    expect(page).to have_content("Welcome")
  end

  it "returns game mode buttons" do
    visit "/"
    expect(page).to have_button("Human vs Human")
    expect(page).to have_button("Human vs Computer")
  end

  it "returns initial grid buttons" do
    visit "/"
    click_button "Human vs Human"
    grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    grid.each do |cell_name|
      expect(page).to have_button(cell_name)
    end
  end

  it "replaces button value with mark" do
    visit "/"
    click_button "Human vs Human"
    click_button "1"
    expect(page).to have_button("X")
  end

  it "switches marks when clicking buttons" do
    visit "/"
    click_button "Human vs Human"
    click_button "1"
    click_button "2"
    mark = ["X", "O"]
    mark.each do |mark|
      expect(page).to have_button(mark)
    end
  end

  it "routes to /result when first player 'X' wins" do
    visit "/"
    click_button "Human vs Human"
    click_button "0"
    click_button "1"
    click_button "3"
    click_button "2"
    click_button "6"
    expect(page).to have_content("Game over")
  end
end
