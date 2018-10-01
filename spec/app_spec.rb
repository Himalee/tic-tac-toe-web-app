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

  context "/game" do
    it "returns status 200 OK" do
      response = get '/game'
      expect(response.status).to eq 200
    end

    it "says Welcome to Tic Tac Toe" do
      get '/game'
      expect(last_response.body).to include('Welcome to Tic Tac Toe')
    end
  end

  it "returns 'Welcome'" do
    Capybara.app = app
    visit "/game"
    expect(page).to have_content("Welcome")
  end

  it "returns name of all initial buttons" do
    visit "/game"
    grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    grid.each do |cell_name|
      expect(page).to have_button(cell_name)
    end
  end

  it "replaces button name with mark" do
    visit "/game"
    click_button "1"
    expect(page).to have_button("X")
  end
end
