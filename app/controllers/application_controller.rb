class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  include SessionsHelper

  def logged_in_user
  	unless logged_in?
  		store_location
  		flash.now[:danger] = "Please log in for that!"
  		redirect_to login_url
  	end
  end
  
end