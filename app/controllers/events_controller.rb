class EventsController < ApplicationController

	before_action :logged_in_user, only: [:create, :destroy, :show]
	before_action :correct_user,   only: :destroy

	def new
		@event = Event.new
	end

	def index
		@events = Event.all.paginate(page: params[:page])
	end

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			flash[:success] = "Event created!"
			redirect_to events_path
		else
			render :new
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	def destroy
		@event.destroy
		flash[:success] = "Event deleted!"
		redirect_to request.referrer || events_path
	end

	private

	def correct_user
		@event = current_user.events.find_by(id: params[:id])
		redirect_to root_url if @event.nil?
	end

	def event_params
		params.require(:event).permit(:name, :location, :date)
	end

end
