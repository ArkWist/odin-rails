require 'sinatra'

number = rand(0..100)

get '/' do
  #"Hello, World!"
  "The secret number is #{number}."
end
