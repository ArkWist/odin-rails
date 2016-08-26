require 'sinatra'

enable :sessions
set :session_secret, 'secret key'

get '/' do
  if session[:game].nil?
    redirect to '/newgame'
  else
    erb :index, locals: { colors: session[:game].colors,
                          tries: session[:game].tries,
                          guesses: session[:game].guesses,
                          difficulty: session[:game].difficulty,
                          status: session[:game].status }
  end
end

post '/' do
  guess = params[:color].values
  session[:game].check_guess(guess)
  redirect to('/')
end

get '/newgame' do
  session[:game] = Mastermind.new
  redirect to('/')
end

#should have letter in circle in-case colorblindness

class Mastermind
  
  attr_accessor :colors, :tries, :guesses, :difficulty, :status
  
  def initialize(range = 8, tries = 10, difficulty = 4)
    @colors = get_colors(range)
    @tries = tries
    @answer = random_code(@colors, difficulty)
    @guesses = []
    @difficulty = difficulty
    @status = 'playing'
  end
  
  def check_guess(code)
    if @tries > 0 && code.length == difficulty && code.all? { |c| @colors.include?(c) }
      @guesses << Guess.new(code, get_keys(code))
      @tries -= 1
      check_game_end
    end
  end
  
  def get_answer
    if win? || lose?
      answer = @answer
    else
      answer = nil
    end
  end
  
  private
  
  def get_colors(range)
    colors = ['red', 'indigo', 'teal', 'yellow',
              'purple', 'light-blue', 'light-green', 'orange',
              'pink', 'blue', 'green', 'amber',
              'deep-purple', 'cyan', 'lime', 'deep-orange',
              'brown', 'grey', 'blue-grey', 'black']
    colors.take(range)
  end
  
  def random_code(colors, difficulty)
    code = []
    difficulty.times { |i| code << colors.sample }
    code
  end
  
  def get_keys(code)
    keys = []
    compare = @answer
    code.each_with_index do |color, i|
      if compare[i] == color
        keys << 'right'
        compare[i] = 'compared'
      end
    end
    code.each_with_index do |color, i|
      if compare.include?(color)
        keys << 'close'
        compare[compare.find_index(color)] = 'compared'
      end
    end
    (@answer.length - keys.length).times { |i| keys << 'wrong' }
    keys
  end
  
  def check_game_end
    if @guesses.last.keys.all? { |key| key == 'right' }
      @status = 'win'
    elsif @tries <= 0
      @status = 'lose'
    end
  end
  
end

class Guess

  attr_reader :code, :keys

  def initialize(code, keys)
    @code = code
    @keys = keys
  end

end

