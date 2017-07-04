class InviteController < ApplicationController
  #before_action :logged_in_user, only: :create
  before_action :logged_in_user, only: [:create, :destroy]
  #before_action :correct_user,   only: [:create, :destroy]
  before_action :event_owner,    only: :create
  before_action :uninvite_power, only: :destroy

  def create
    @attendee       = User.find_by(id: user_param)
    @attended_event = Event.find_by(id: event_param)
    if Invite.create!(attended_event: @attended_event, attendee: @attendee)
      redirect_to @attended_event
    else
      redirect_to current_user
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
      redirect_to request.referrer || current_user
    end
  end

  private
  
    def event_owner
      redirect_to current_user if current_user != Event.find_by(id: event_param).creator
    end
    
    def uninvite_power
      if current_user == Event.find_by(id: event_param).creator
        redirect_to current_user if current_user == User.find_by(id: user_param)
      elsif current_user != User.find_by(id: user_param)
        redirect_to current_user
      end
    end
    
    def event_param
      params.require(:event_id)
    end
    
    def user_param
      params.require(:attendee)
    end
    
end
