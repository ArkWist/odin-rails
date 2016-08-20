require 'sinatra'

enable :sessions

dictionary = File.read('5desk.txt').readlines

get '/' do
  handle_game_finish
  erb :index
  #erb :index, locals: { progress: progress,
  #                      guesses: guesses,
  #                      turns: turns }
end

pos '/' do
  check_guess(params['guess'])
  redirect to('/')
end


get '/newgame' do
  session[:answer] = choose_random_word(dictionary)
  session[:progress] = '_' * session[:answer].length
  session[:guesses] = []
  session[:bad_guesses] = []
  session[:turns] = 9
  redirect to('/')
end

get '/win' do
  erb :win
end

get '/lose' do
  erb :lose
end



def handle_game_finish
  if session[:progress] == session[:answer]
    redirect to('/win')
  elsif session[:turns] <= 0
    redirect to('/lose')
  end
end

def choose_random_word(dictionary)
  word = dictionary[rand(dictionary.length)]
  if !word.length.between?(5, 12)
    word = get_word_from_dictionary(dictionary)
  end
  word
end

def check_guess(guess)
  if !('a'..'z').to_a.include?(guess.downcase)
    #return
  elsif session[:guesses].include?(guess.downcase)
    #return
  elsif session[:answer].include?(guess.downcase)
    session[:answer].each_with_index do |letter, i|
    if letter == guess.downcase
      session[:progress][i] = guess.downcase
    end
    session[:guesses] << guess.downcase
  end
  else
    session[:turns] -= 1
    session[:guesses] << guess.downcase
    session[:bad_guesses] << guess.downcase
  end
end




  






def display_board(right, wrong, mercy)
  padding = " " * 4
  puts
  puts "#{padding}#{right.join(" ")}"
  puts
  puts "#{padding}Wrong: #{wrong.join(", ")}"
  puts "#{padding}#{mercy} wrong guesses left."
  puts
end

def save(right, wrong, mercy, answer)
  filename = get_filename
  File.open(filename, "w") do |file|
    file.puts "right=#{right}"
    file.puts "wrong=#{wrong}"
    file.puts "mercy=#{mercy}"
    file.puts "answer=#{answer}"
  end
  puts "#{filename} saved."
end

def get_filename
  print "Input filename: "
  filename = gets.chomp.downcase + ".sav"
end

def save_var(line)
  line.split("=").at(0)
end

def sav_value(line)
  line.split("=").at(1)
end


### Program Start ###

answer = random_word
right = ["_"] * answer.length
wrong = []
mercy = 9

print "Load save game? (y/n): "
if gets.chomp.downcase == "y"
  filename = get_filename
  if File.exist?(filename)
    File.readlines(filename) do |line|
      case save_var(line)
      when right
        right = save_value(line)
      when wrong
        wrong = save_value(line)
      when mercy
        mercy = save_value(line)
      when answer
        answer = save_value(line)
      end
    end
    puts "#{filename} loaded."
  else
  puts "#{filename} does not exist."
end
    
until mercy < 0 || !solved.include?("_")
  display_board(right, wrong, mercy)
  print "Input guess: "
  guess = gets.chomp.to_s.downcase

  next if guess.length != 1 && guess != "save"
  next if right.each.downcase.include?(guess)
  next if wrong.include?(guess)

  if guess == "save"
    save(right, wrong, mercy, answer)
  elsif answer.downcase.to_a.include?(guess)
    answer.each_with_index do |letter, index|
      right[index] = answer[index] if guess == letter.downcase
    end
  else
    mercy -= mercy
    wrong.push(guess)
  end
end

puts
if mercy < 0
  puts "You lose!"
  puts
  puts "The answer was: #{answer}"
else
  puts "Congratulations!"
  puts
  puts "You are victorious!"
end
puts
