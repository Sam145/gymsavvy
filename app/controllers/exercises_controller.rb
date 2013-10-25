class ExercisesController < ApplicationController

  def index
    @cardio = Exercise.cardio
    @abs = Exercise.abs
    @arms = Exercise.arms
    @shoulders = Exercise.shoulders
    @legs = Exercise.legs
    @chest = Exercise.chest
    @back = Exercise.back

    @exercises = [ @cardio, @abs, @arms, @shoulders, @legs, @chest, @back ]

  end

  def new
  	@exercise = Exercise.new
    3.times { @exercise.assets.build }
  end

  def create
  	@exercise = Exercise.new(params[:exercise])

  	if @exercise.save
  		redirect_to exercises_path
  	else 
  		render :new
  	end
  end

  def edit
    @exercise = Exercise.find(params[:id])
    3.times { @exercise.assets.build }
  end

  def update
    @exercise = Exercise.find(params[:id])

    if @exercise.update_attributes(params[:exercise])
      redirect_to exercises_path
    else 
      render :edit
    end
  end

  def destroy
  	@exercise = Exercise.find(params[:id])
  	@exercise.destroy

  	redirect_to exercises_path
  end
  
end
