class UsersController < ApplicationController

	before_action :logged_in_user, only: [:edit, :update, :destroy, :index, :show]
	before_action :correct_user,   only: [:edit, :update]

	def index
		@users = User.all.paginate(page: params[:page])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash.now[:success] = "User successfully created"
			UserMailer.welcome_email(@user).deliver!
			log_in @user
			redirect_to @user
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
		@events = @user.events.paginate(page: params[:page])
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	end

end
