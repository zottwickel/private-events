class UsersController < ApplicationController

	before_action :logged_in_user, only: [:edit, :update, :destroy]
	before_action :correct_user,   only: [:edit, :update]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash.now[:success] = "User successfully created"
			redirect_to @user
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
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
