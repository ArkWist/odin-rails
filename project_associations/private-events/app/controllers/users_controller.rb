class UsersController < ApplicationController
  before_action :not_logged_in_user, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You have signed up as #{@user.name}."
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.attended_events.upcoming.paginate(page: params[:upcoming_page])
    @previous_events = @user.attended_events.previous.paginate(page: params[:previous_page])
    @hosted_events = @user.events.paginate(page: params[:hosted_page])
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
end
