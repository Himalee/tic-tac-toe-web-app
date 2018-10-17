require 'sinatra'
require 'erb'
require 'json'
require_relative 'models/board.rb'
require_relative 'models/game.rb'

enable :sessions

get '/' do
  erb :game_mode
end

post '/game' do
  new_game
  @grid = display_grid
  erb :game
end

post '/game/play' do
  play_turn
  @grid = display_grid
  result
  erb :game
end

get "/result" do
  @grid = display_grid
  @result = display_result
  erb :game
end

private

def new_game
  session[:game] = GameFactory.new.game(game_mode)
end

def move
  params["cell"]
end

def game_mode
  params["game_mode"]
end

def play_turn
  session[:game].play_turn(move.to_i)
end

def result
  if session[:game].end_of_game?
    redirect "/result"
  end
end

def display_result
  session[:game].result
end

def display_grid
  session[:game].get_grid
end



