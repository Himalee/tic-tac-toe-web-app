require 'sinatra'
require 'erb'
require 'json'
require_relative 'lib/board.rb'

before do
  @board = Board.new
end

get '/game' do
  @grid = Array.new(9, "")
  @board.store_grid(@grid)
  erb :game, { :layout => true }
end

post '/game/play' do
  @grid = @board.get_grid
  move = params["cell"]
  @board.store_marked_grid(@grid, move.to_i, @board.get_mark(@grid))
  if @board.end_of_game?(@grid, "X", "O")
    redirect "/result"
  end
  erb :game, { :layout => true }
end

get "/result" do
  @grid = @board.get_grid
  @result = @board.result(@grid)
  erb :result, { :layout => true }
end



