class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])

  	if @user.save
      sign_in @user
  		redirect_back_or(new_program_set_path) 
      flash[:notice] = "Hi there! Welcome to your gym buddy"
  	else
  		render 'new'
  	end
  end

end
