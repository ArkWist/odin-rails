class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
    
    def not_logged_in_user
      if logged_in?
        redirect_to @current_user
      end
    end
  
  
end
