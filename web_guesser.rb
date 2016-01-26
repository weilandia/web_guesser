require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

get '/' do
  erb :index, :locals => { :number => NUMBER }
end
