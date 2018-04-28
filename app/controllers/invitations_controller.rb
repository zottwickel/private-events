class InvitationsController < ApplicationController

	def new
		@invitation = Invitation.new
		@event = Event.find(params[:event_id])
		@users = User.all.paginate(page: params[:page])
	end

	def create
		@invitation = Invitation.create(params[:event_from], params[:guest_id])
		@event = Event.find(params[:event_id])
		@users = User.all.paginate(page: params[:page])
		if @invitation.save
			redirect_to event_path(@event)
		else
			flash[:danger] = "the database is trippin"
			render :new
		end
	end

	def update
		@invitation.accepted = true
		flash[:success] = "You are attending this event!"
		redirect_to event_path(@event)
	end

end
