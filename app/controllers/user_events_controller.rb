class UserEventsController < ApplicationController
	before_filter :authenticate_user!

	def new
		@user = User.find(current_user)
		@user_event = UserEvent.new
	end	

	def create
		@user = User.find(current_user)
		@user_event = UserEvent.new(params.require(:user_event).permit(:user_id, :event_id, :ticket_type, :lodging))
		if @user_event.save
			redirect_to [@user, @user_event]
		else
			render action: new
		end
	end
 
  def show
  	@user_event = UserEvent.find(params[:id])
  	@event_id = @user_event.event
  	@event_name = @user_event.event.event_name
  	@event_start_date = @user_event.event.start_date
  	@event_end_date = @user_event.event.start_date + @user_event.event.duration - 1
    @user_events = UserEvent.where(event_id: @event_id)
  end

  def edit
  	@user = User.find(current_user)
  	@user_event = UserEvent.find(params[:id])
  	@event_name = @user_event.event.event_name
  end

  def update
  	@user = User.find(current_user)
  	@user_event = UserEvent.find(params[:id])
  	if @user_event.update_attributes(params.require(:user_event).permit(:ticket_type, :lodging, :note))
  		redirect_to user_user_event_path(current_user, @user_event)
  	else
  	end
  end

  def destroy
  	@user = User.find(current_user)
  	@user_event = UserEvent.find(params[:id])
  	@user_event.destroy
  	redirect_to events_path
  end
end
