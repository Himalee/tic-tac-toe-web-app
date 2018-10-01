require 'sinatra'
require 'erb'

get '/game' do
  @grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  erb :game, { :layout => true }
end

