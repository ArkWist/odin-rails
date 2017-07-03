class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "You are now hosting the event #{@event.title}."
      redirect_to @event
    else
      #flash.now[:danger] = "Invalid name/password combination."
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @uninvited_users = uninvited_users
  end
  
  def destroy
    @event.destroy
    flash[:success] = "Event deleted"
    redirect_to @current_user
  end

  def index
    @events = Event.all
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event #{@event.title} updated"
      redirect_to @event
    else
      render 'edit'
    end
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :location, :description, :date)
    end
    
    def uninvited_users
      User.where.not(id: @event.attendee_ids).where.not(id: @event.creator_id)
    end
    
    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to current_user if @event.nil?
    end
  
end