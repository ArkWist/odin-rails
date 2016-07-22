require 'sinatra'
require 'sinatra/reloader'

number = rand(100)
#@@remaining = 0

def check_guess(guess, number)
  message = if !guess.to_i.to_s == guess then ""
            elsif guess.to_i == number then "You got it right!"
            else "#{(guess.to_i - number).abs > 5 ? "Way too" : "Too"} #{guess.to_i - number > 0 ? "high" : "low"}." end
end

def check_background(guess, number)
  background = if !guess.to_i.to_s == guess then ""
               elsif guess.to_i == number then "#0F0"
               else (guess.to_i - number).abs > 5 ? "#F33" : "#F93" end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess, number)
  background = check_background(guess, number)
  erb :index, :locals => {:number => number, :message => message, :background => background}
end

