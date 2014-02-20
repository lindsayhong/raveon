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
			redirect_to @user
		else
			render action: new
		end
	end
 
  def show
  	@user_event = UserEvent.find(params[:id])
  end
end
