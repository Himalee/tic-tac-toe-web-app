require 'sinatra'
require 'erb'
require 'json'

get '/game' do
  @grid = Array.new(9, "")
  store_grid(@grid)
  erb :game, { :layout => true }
end

post '/game/play' do
  @grid = get_grid
  move = params["cell"]
  if @grid.count("X") == 0 && @grid.count("O") == 0
    mark = "X"
  elsif @grid.count("X") == @grid.count("O")
    mark = "X"
  else
    mark = "O"
  end
  @grid[move.to_i] = mark
  store_grid(@grid)
  erb :game, { :layout => true }
end

def store_grid(grid)
  hash = { "grid" => grid }
  File.open("public/grid.json", "w") do |file|
    file.write(hash.to_json)
  end
end

def get_grid
  file = File.read("public/grid.json")
  data_hash = JSON.parse(file)
  data_hash["grid"]
end


