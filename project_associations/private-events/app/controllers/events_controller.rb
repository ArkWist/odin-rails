class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :invite]
  
  def new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @uninvited_users = uninvited_users
  end

  def index
    @events = Event.all
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :location, :description, :date)
    end
    
    def uninvited_users
      User.where.not(id: @event.attendee_ids).where.not(id: @event.creator_id)
    end
  
end