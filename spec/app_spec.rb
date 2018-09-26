ENV['RACK_ENV'] = 'test'

require 'app'
require 'rspec'
require 'rack/test'

describe 'The TicTacToe App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says Welcome to Tic Tac Toe" do
    get '/game'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Welcome to Tic Tac Toe')
  end
end
