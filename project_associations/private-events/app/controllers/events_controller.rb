class EventsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
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
  end

  def index
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :location, :description, :date)
    end
  
end
