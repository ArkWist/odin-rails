class InviteController < ApplicationController
  #before_action :logged_in_user, only: :create
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: [:create, :destroy]

  def create
    @attendee       = User.find_by(id: user_param)
    @attended_event = Event.find_by(id: event_param)
    if Invite.create!(attended_event: @attended_event, attendee: @attendee)
      redirect_to @attended_event
    else
      redirect_to @current_user
    end
  end

  def show
  end
  
  def destroy
    @attendee       = User.find_by(id: user_param)
    @attended_event = Event.find_by(id: event_param)
    @invite = Invite.find_by(attended_event: @attended_event, attendee: @attendee)
    @invite.destroy
    if @invite.destroyed?
      redirect_to @attended_event
    else
      redirect_to @current_user
    end
  end

  private
  
    def correct_user
      redirect_to @current_user if @current_user != Event.find_by(id: params[:event_id]).creator
    end
    
    def event_param
      params.require(:event_id)
    end
    
    def user_param
      params.require(:attendee)
    end
    
end
