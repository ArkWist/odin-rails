class InviteController < ApplicationController
  #before_action :logged_in_user, only: :create
  before_action :correct_user,   only: :create
  
  def new
  end

  def create
    @invite = event.invites.build(invite_params)
  end

  def show
  end
end

  private
  
    def correct_user
      redirect_to users if @current_user.id != params[:user]
    end
  
    def invite_params
      params.require(:invite).permit(:attendee)
    end
    
    def event
      params[:event]
    end