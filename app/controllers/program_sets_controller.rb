class ProgramSetsController < ApplicationController

  before_filter :signed_in_user, only: :index


  def index
    @program_sets = current_user.program_sets

  end


  def show
    @program_set = ProgramSet.find(params[:id])
  end


  def new
    @program_set = ProgramSet.new
    find_exercises

  end


  def edit
    @program_set = ProgramSet.find(params[:id])
    find_exercises

  end



  def create
    @program_set = ProgramSet.new(params[:program_set])

    if params[:add_exercise]
      @add_exercises = Exercise.find(params[:add_exercise][:exercise_id].keys)
    end

    if @add_exercises
      @add_exercises.each do |exercise|
        program = @program_set.programs.build
        program.exercise = exercise
        @program_set.save
      end
     flash[:success] = "You have created a Program!!"
     redirect_to edit_program_set_path(@program_set.id)
    else
      redirect_to new_program_sets_path
    end

  end


  def update
    @program_set = ProgramSet.find(params[:id])


    if params[:add_exercise]
      @add_exercises = Exercise.find(params[:add_exercise][:exercise_id].keys)

      if @add_exercises
        @add_exercises.each do |exercise|
          program = @program_set.programs.build
          program.exercise = exercise
          @program_set.save
        end
          redirect_to edit_program_set_path(@program_set.id)
   #    flash[:success] = "You have created a Program!!"
      else
        ####### ISSUE! if no info provided the new action errors out, needs to be fixed
  #      render action: "new" 
      end

    else
      ##### THIS PART UPDATES THE PROGRAM RECORDS ######
    if @program_set.update_attributes(params[:program_set])
      flash[:success] = "You have created a Program!!"
      current_user.program_sets << @program_set
      redirect_to program_set_path(@program_set.id)
    else
      render 'edit'
    end


    end 

  end



  def destroy
    @program_set = ProgramSet.find(params[:id])
    @program_set.destroy
    redirect_to program_sets_path

  end

end
