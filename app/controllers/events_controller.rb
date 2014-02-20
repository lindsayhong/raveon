class EventsController < ApplicationController
  def index
  	@events = Event.all.sort_by! &:start_date
    @user_events = UserEvent.where(user_id: current_user)
    @event_array = []
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
  	@event = Event.new
  end

  def create
  	@event = Event.new(params.require(:event).permit(:event_name, :start_date, :duration, :venue, :city, :state))

  	if @event.save
  		redirect_to events_index_path
  	else
  		render action: new
  	end
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def update
  	@event = Event.find(params[:id])
  	@event.update_attributes(params.require(:event).permit(:event_name, :start_date, :duration, :venue, :city, :state))
  	redirect_to @event
  end
end
