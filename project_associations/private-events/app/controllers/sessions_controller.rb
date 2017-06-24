class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to login_url
  end
  
end
