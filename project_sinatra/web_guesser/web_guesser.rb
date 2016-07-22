require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

def check_guess(guess, number)
  if guess.nil?
    message = ""
  else
    message = if guess.to_i == number then "You got it right!"
              elsif guess.to_i > number + 5 then "Way too high!"
              elsif guess.to_i > number then "Too high!"
              elsif guess.to_i < number - 5 then "Way too low!"
              elsif guess.to_i < number then "Too low!"
              else "" end
  end
  message
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess, number)
  erb :index, :locals => {:number => number, :message => message}
end

