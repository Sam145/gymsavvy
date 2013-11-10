class SessionsController < ApplicationController

  def new
  	@user = User.new
  end
  
  def create
	  user = User.authenticate(params[:email], params[:password])
	  if user
	    session[:user_id] = user.id
	    redirect_back_or program_sets_path
	    flash[:notice] = "Logged in!"
	  else
	    flash[:notice] = "Invalid email or password"
	    redirect_to controller: "sessions", action: "new"
	  end
	end

	def destroy
	  session[:user_id] = nil  
	  redirect_to root_url
	  flash[:notice] = "Logged out!"
	end
	
end
