class ApplicationController < ActionController::Base
  protect_from_forgery

  	def pluraling(count, name)
  		if count == 1
  			1.to_s + ' name'
  		else
  			count.to_s ' name\'s'
  		end
  	end

	def find_exercises
	  @cardio = Exercise.cardio
	  @abs = Exercise.abs
	  @arms = Exercise.arms
	  @shoulders = Exercise.shoulders
	  @legs = Exercise.legs
	  @chest = Exercise.chest
	  @back = Exercise.back
	end

	helper_method :current_user

	private

	def sign_in(user)
		session[:user_id] = user.id
		self.current_user = user
	end

	def current_user=(user)
	  @current_user = user
	end

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def signed_in_user
		if current_user.nil?
			store_location
			redirect_to log_in_path
		end
	end

	def redirect_back_or(default)
	    redirect_to(session[:return_to] || default)
	    session.delete(:return_to)
	end

	def store_location
    	session[:return_to] = request.url
	end

end
