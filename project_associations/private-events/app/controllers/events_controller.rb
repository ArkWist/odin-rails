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
    @upcoming_events = upcoming_events
    @previous_events = previous_events
  end
  
  def invite
    #if event_creator?
      @attended_event = Event.find(invite_params[:attended_event])
      puts "Event Title: #{@attended_event.title}"
      @attendee       = User.find(invite_params[:attendee])
      puts "Attendee Name: #{@attendee.name}"
      @invite         = @attended_event.invites.build(attendee_id: @attendee)
      @invite.save
    #end
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :location, :description, :date)
    end
    
    def upcoming_events
      Event.where("date >= ?", DateTime.now.to_date)
    end
    
    def previous_events
      Event.where("date < ?", DateTime.now.to_date)
    end
    
    def uninvited_users
      User.where.not(id: @event.attendee_ids).where.not(id: @event.creator_id)
    end
    
    def event_creator?
      Event.find(invite_params[:attended_event]).creator == @current_user
    end
    
    def invite_params
      params.require(:invite).permit(:attended_event, :attendee)
    end

  
end