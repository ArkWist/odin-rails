class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(name: params[:session][:name])
    if user
      # Log in
      session[:user_id] = user.id
      redirect_to user
    else
      # Error
      render 'new'
    end
  end
  
  def destroy
  end
  
end
