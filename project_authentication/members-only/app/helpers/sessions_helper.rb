module SessionsHelper
  
  def log_in(user)
    remember_token = User.new_token
    cookies.permanent[:remember_token] = remember_token
    session[:user_id] = user.id
    @current_user = user
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  
  def current_user=(user)
    @current_user = user
  end
 
 
  def log_out
    session.delete(:user_id)
    cookies.delete(:remember_token) #Delete cookies[:remember_token]
    @current_user = nil
  end
  
  
end
