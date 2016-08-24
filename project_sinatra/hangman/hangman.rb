require 'sinatra'

enable :sessions
set :session_secret, 'secret key'

get '/' do
  if session[:game].nil?
    redirect to '/newgame'
  else
  session[:guess] = params['guess']
  session[:guess].downcase! if session[:guess]
  session[:game].check_guess(session[:guess])
  erb :index, :layout => true, locals: { progress: session[:game].progress,
                        bad_guesses: session[:game].bad_guesses,
                        tries: session[:game].tries,
                        status: session[:game].status,
                        answer: session[:game].get_answer }  
  end
end

get '/newgame' do
  session[:game] = Hangman.new
  redirect to('/')
end

# replaces number 1
get '/save' do
  Dir.mkdir 'saves' unless Dir.exists? 'saves'
  filename = "#{Dir.glob('saves/*.sav').sort_by { |file| file.scan(/\d+/).map { |id| id.to_i } }.last.scan(/\d+/).last.to_i + 1 }.sav"
  session[:game].save_to('saves', filename)
  redirect to('/')
end

get '/load' do
  files_number = 12
  if Dir.exist?('saves') && Dir['saves/*'].length > 0
    saves = Dir.glob('saves/*.{sav}').sort_by { |file| file.scan(/\d+/).map { |id| id.to_i } }.last(files_number).map { |save| save.split('/')[-1] }
    saves_progress = saves.map { |save| session[:game].extract_save_progress('saves', save) }
    erb :load, locals: { dir: 'saves',
                         saves: saves,
                         saves_progress: saves_progress }
  else
    redirect to('/')
  end
end

# doesn't get called
get '/load/:filename' do
  session[:game].load_from('saves', params['filename'])
  redirect to('/')
end


class Hangman

  attr_reader :progress, :bad_guesses, :tries, :status

  def initialize(tries = 9, min = 5, max = 12)
    @answer = random_word_between(min, max)
    @progress = '_' * @answer.length
    @bad_guesses = []
    @tries = tries
    @status = nil
  end

  def check_guess(guess)
    if guess.nil?
      #return
    elsif !('a'..'z').to_a.include?(guess)
      #return
    elsif @progress.include?(guess)
      #return
    elsif @bad_guesses.include?(guess)
      #return
    elsif @answer.include?(guess)
      new_progress = @progress.split(//)
      @answer.split(//).each_with_index do |letter, i|
        if letter == guess
          new_progress[i] = guess
        end
      end
      @progress = new_progress.join
    else
      @tries -= 1
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
  
  def save_to(dir, filename)
    File.open("#{dir}/#{filename}", 'w') do |file|
      file.puts "progress=#{@progress}"
      file.puts "bad_guesses=#{@bad_guesses.join(',')}"
      file.puts "tries=#{@tries}"
      file.puts "answer=#{@answer}"
      file.puts "status=#{status}"
    end
  end
  
  def load_from(dir, filename)
    if File.exist?("#{dir}/#{filename}")
      File.open("#{dir}/#{filename}", 'r').readlines.each do |line|
        value = save_value(line)
        case save_var(line)
        when 'progress' then @progress = value
        when 'bad_guesses' then @bad_guesses = value.split(',')
        when 'tries' then @tries = value.to_i
        when 'answer' then @answer = value
        when 'status' then @status = value
        end
      end
    end
  end

  def extract_save_progress(dir, filename)
    progress = 'Invalid Save'
    if File.exist?("#{dir}/#{filename}")
      File.open("#{dir}/#{filename}", 'r').readlines.each do |line|
        if save_var(line) == 'progress'
          progress = save_value(line.chomp)
        end
      end
    end
    progress
  end

  private

  def check_game_end
    if @progress == @answer
      @status = 'win'
    elsif @tries <= 0
      @status = 'lose'
    end
  end

  def random_word_between(min, max)
    dictionary = File.open('public/5desk.txt', 'r').readlines
    word = ""
    until word.length.between?(min, max)
      word = dictionary[rand(dictionary.length)].strip.downcase
    end
    word
  end
  
  def save_var(line)
    line.split("=").at(0)
  end
  
  def save_value(line)
    line.split("=").at(1)
  end

end

