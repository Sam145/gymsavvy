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

	helper_method [:current_user, :button_image, :male_female, :font_color, :error_check, :blue_pink]

	private

	def error_check(instance)
		if @user.errors.any?
			"display: block;"
		end
	end

	def font_color(exercise)
		case exercise.muscle_group
          when 'Cardio' then "red"
          when 'Abs and Obliques' then "brown"
          when 'Biceps and Triceps' then "blue"
          when 'Shoulders' then "green" 
          when 'Legs' then "purple"
          when 'Chest' then "yellow"
          when 'Back' then "orange"
        end
	end

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

	def male_female(css_class_name)
		if !current_user.nil?
			if current_user.mf?
		  		"#{css_class_name} #{css_class_name}male"
		  	else
		  		"#{css_class_name} #{css_class_name}female"
		  	end
		else
			"#{css_class_name}"
		end
	end

	def blue_pink(instance, css_class_name)
		case instance.category
			when "bulking" || "lean" || "lose" then 
				"#{css_class_name} #{css_class_name}blue"
		  	when "apple" || "hour" || "pear" || "tube" then 
		  		"#{css_class_name} #{css_class_name}pink"
			else 
				"#{css_class_name}"
		end
	end

	def button_image(image_name)
		if !current_user.nil?
			if current_user.mf?
		  		"buttons/male/#{image_name}"
		  	else
		  		"buttons/female/#{image_name}"
		  	end
		else
			"#{image_name}"
		end
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
