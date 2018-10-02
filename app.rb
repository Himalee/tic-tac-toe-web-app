require 'sinatra'
require 'erb'

get '/game' do
  @grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  erb :game, { :layout => true }
end

post '/game/play' do
  @grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  guess = params["cell"]
  @grid[guess.to_i] = "X"
  erb :game, { :layout => true }
end


