class InviteController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
  def new
  end

  def create
    @invite = event.invites.build(invite_params)
  end

  def show
  end
end

  private
  
    def invite_params
      params.require(:invite).permit(:guest)
    end