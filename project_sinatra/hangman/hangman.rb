require 'sinatra'

enable :sessions

get '/' do
  if session[:game].nil?
    redirect to '/newgame'
  else
  session[:guess] = params['guess']
  session[:guess].downcase! if session[:guess]
  session[:game].check_guess(session[:guess])
  erb :index, locals: { progress: session[:game].progress,
                        bad_guesses: session[:game].bad_guesses,
                        tries: session[:game].tries,
                        status: session[:game].status,
                        answer: session[:game].get_answer }
  end
end


##get '/' do
##  game.check_guess
  #handle_game_finish
  #erb :index
##  erb :index, locals: { progress: progress,
##                        bad_guesses: bad_guesses,
##                        tries: tries }
##end

#post '/' do
#  check_guess(params['guess'])
#  redirect to('/')
#end


get '/newgame' do
  session[:game] = Hangman.new
  redirect to('/')
  #session[:answer] = choose_random_word(dictionary)
  #session[:progress] = '_' * session[:answer].length
  #session[:guesses] = []
  #session[:bad_guesses] = []
  #session[:tries] = 9
  #redirect to('/')
end

#get '/win' do
#  erb :win
#end

#get '/lose' do
#  erb :lose
#end


class Hangman

  attr_reader :progress, :bad_guesses, :tries, :status

  def initialize(tries = 9, min = 5, max = 12)
    @answer = random_word_between(min, max)
    @progress = '_' * @answer.length
    @guesses = []
    @bad_guesses = []
    @tries = tries
    @status = nil
  end

  def check_guess(guess)
    if guess.nil?
      #return
    elsif !('a'..'z').to_a.include?(guess)
      #return
    elsif @guesses.include?(guess)
      #return
    elsif @answer.include?(guess)
      new_progress = @progress.split(//)
      @answer.split(//).each_with_index do |letter, i|
        if letter == guess
          new_progress[i] = guess
        end
      end
      @progress = new_progress.join
      @guesses << guess
    else
      @tries -= 1
      @guesses << guess
      @bad_guesses << guess
    end
    check_game_end
  end

  def get_answer
    if @status == "lose"
      answer = @answer
    else
      answer = nil
    end
  end

  private

  def check_game_end
    if @progress == @answer
      @status = "win"
    elsif @tries <= 0
      @status = "lose"
    end
  end

  def random_word_between(min, max)
    #dictionary = File.read('5desk.txt').readlines
    dictionary = File.open('5desk.txt', 'r').readlines
    word = ""
    until word.length.between?(min, max)
      word = dictionary[rand(dictionary.length)].strip.downcase
    end
    word
  end

end

=begin

  def handle_game_finish
  ' '
    if session[:progress] == session[:answer]
      redirect to('/win')
    elsif session[:tries] <= 0
      redirect to('/lose')
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

=end