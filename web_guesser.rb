require 'sinatra'
require 'sinatra/reloader'

N = rand(100)

def message
  params["guess"].to_i > N + 5 ? "Way too high!" :
  params["guess"].to_i < N - 5 ? "Way too low!" :
  params["guess"].to_i > N ? "Too high!" :
  params["guess"].to_i < N ? "Too low!" : "You got it right!"
end

def secret
  params["guess"].to_i == N ? "The SECRET NUMBER is #{N}" : ""
end

get '/' do
  erb :index, :locals => { :secret => secret, :message =>   message }
end
