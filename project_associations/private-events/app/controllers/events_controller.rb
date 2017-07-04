class EventsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy, :edit, :update]
  before_action :event_owner,    only: [:destroy, :edit, :update]
  
  def new
    @event = Event.new
  end

  def create
    @event  = current_user.events.build(event_params)
    if @event.save
      @invite = @event.invites.build(attendee: current_user)
      @invite.save
      flash[:success] = "You are now hosting the event #{@event.title}."
      redirect_to @event
    else
      flash.now[:danger] = "Invalid event information."
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @invited_users = @event.attendees.paginate(page: params[:invited_page])
    @uninvited_users = uninvited_users.paginate(page: params[:uninvited_page])
  end
  
  def destroy
    @event.destroy
    flash[:success] = "Event deleted"
    redirect_to current_user
  end

  def index
    @upcoming_events = Event.all.upcoming.paginate(page: params[:upcoming_page])
    @previous_events = Event.all.previous.paginate(page: params[:previous_page])
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
      User.where.not(id: @event.attendee_ids)
    end
    
    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to current_user if @event.nil?
    end
    
    def event_owner
      redirect_to current_user if current_user != Event.find(params[:id]).creator
    end
  
end