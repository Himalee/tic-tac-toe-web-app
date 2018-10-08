require 'sinatra'
require 'erb'
require 'json'
require_relative 'lib/board.rb'

get '/game' do
  board = Board.new
  @grid = Array.new(9, "")
  board.store_grid(@grid)
  erb :game, { :layout => true }
end

post '/game/play' do
  board = Board.new
  @grid = board.get_grid
  move = params["cell"]
  board.store_marked_grid(@grid, move.to_i, board.get_mark(@grid))
  erb :game, { :layout => true }
end



