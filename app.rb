require 'sinatra'
require 'erb'
require 'json'
require_relative 'lib/board.rb'
require_relative 'lib/game.rb'

enable :sessions

get '/game' do
  new_game
  @grid = display_grid
  erb :game, { :layout => true }
end

post '/game/play' do
  play_move
  @grid = display_grid
  result
  erb :game, { :layout => true }
end

get "/result" do
  @grid = display_grid
  @result = display_result
  erb :result, { :layout => true }
end

private

def new_game
  board = Board.new(Array.new(9, ""))
  session[:game] = Game.new(board)
end

def move
  params["cell"]
end

def play_move
  session[:game].play_game(move.to_i)
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



