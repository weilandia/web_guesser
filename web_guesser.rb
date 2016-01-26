require 'sinatra'
require 'sinatra/reloader'

N = rand(1..100)

def message
  if params["guess"].to_i == 0 then "Guess a number between 1 and 100."
  elsif params["guess"].to_i > N + 5
    @form_ouput = "background-color: #F22613"
    "Way too high!"
  elsif params["guess"].to_i < N - 5
    @form_ouput = "background-color: #F22613"
    "Way too low!"
  elsif params["guess"].to_i > N
    @form_ouput = "background-color: #F89406"
    "Too high!"
  elsif params["guess"].to_i < N
    @form_ouput = "background-color: #F89406"
    "Too low!"
  else
    @form_ouput = "display: none"
    @win_background = "background-color: #3FC380"
    "You got it right!"
  end
end

def secret
  params["guess"].to_i == N ? "The SECRET NUMBER is #{N}" : ""
end

get '/' do
  erb :index, :locals => { :secret => secret, :message =>   message, :form => @form_ouput}
end
