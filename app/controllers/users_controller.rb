class UsersController < ApplicationController
	before_filter :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@user_events = UserEvent.where(user_id: params[:id])
  end
end
