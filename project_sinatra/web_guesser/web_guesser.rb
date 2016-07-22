require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

def check_guess(guess, number)
  message = if !guess.to_i.to_s == guess then ""
            elsif guess.to_i == number then "You got it right!"
            else "#{(guess.to_i - number).abs > 5 ? "Way too" : "Too"} #{guess.to_i - number > 0 ? "high" : "low"}." end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess, number)
  erb :index, :locals => {:number => number, :message => message}
end

