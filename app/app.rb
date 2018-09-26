require 'sinatra'
require 'erb'

get '/game' do
  erb :game
end
