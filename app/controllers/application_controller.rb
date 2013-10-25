class ApplicationController < ActionController::Base
  protect_from_forgery

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

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

end
