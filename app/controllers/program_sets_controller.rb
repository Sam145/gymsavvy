class ProgramSetsController < ApplicationController

  before_filter :signed_in_user
  before_filter :validate_user, only: [ :show, :update, :destroy]


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
        set_name
        @program_set.save
        current_user.program_sets << @program_set
      end
     flash[:success] = "You have created a programme!!"
     redirect_to edit_program_set_path(@program_set.id)
    else
      redirect_to new_program_set_path
    end

  end


  def update

    @program_set = ProgramSet.find(params[:id])

        ##### THIS ADDS PROGRAMS TO PROGRAMS SET AND UPDATES RECORDS THEN REDIRECTS BACK TO EDIT ######
    if params[:add_exercise] && @program_set.update_attributes(params[:program_set])
        current_user.program_sets << @program_set
        add_exercise

          ##### THIS JUST ADDS PROGRAMS TO PROGRAMS SET AND REDIRECTS BACK TO EDIT ######
    elsif params[:add_exercise]
        add_exercise
    else
        ##### THIS JUST UPDATES RECORDS AND REDIRECTS TO SHOW PAGE ######
        if @program_set.update_attributes(params[:program_set])
          flash[:success] = "Your programme has updated!!"
          current_user.program_sets << @program_set
          redirect_to program_set_path(@program_set.id)
        else
          render 'edit'
        end
    end 

  end


  def clone_program
    original_program_set = ProgramSet.find(params[:id])
    # This duplicates the record and assigns to the current user
    new_program_set = original_program_set.dup
    new_program_set.category = nil
    new_program_set.user_id = current_user.id
    new_program_set.save

    # This duplicates the associations and saves them to the new record 
      original_program_set.programs.each do |program|
        new_program = program.dup
        new_program.program_set_id = new_program_set.id
        new_program.save
      end

    redirect_to edit_program_set_path(new_program_set.id)
  end


  def destroy
    @program_set = ProgramSet.find(params[:id])
    @program_set.destroy
    flash[:success] = "You have deleted a programme!!"
    redirect_to program_sets_path

  end



  private

  def add_exercise
      @add_exercises = Exercise.find(params[:add_exercise][:exercise_id].keys)

      if @add_exercises
        @add_exercises.each do |exercise|
          program = @program_set.programs.build
          program.exercise = exercise
          @program_set.save
        end
          redirect_to edit_program_set_path(@program_set.id)
          flash[:success] = "You added 
            #{@add_exercises.count == 1 ? '1 exercise' : @add_exercises.count.to_s + ' exercises' } to your programme!!"
      else
        ####### ISSUE! if no info provided the new action errors out, needs to be fixed
  #      render action: "new" 
      end
  end

  def set_name
     count = current_user.program_sets.count + 1
    unless @program_set.name?
      @program_set.name = "Programme #{count}"
    end
  end

  def validate_user
    program_set = ProgramSet.find(params[:id])
    unless current_user.id == program_set.user.id
      redirect_to program_sets_path
      flash[:notice] = "You can only change your own records"
    end
  end







end
