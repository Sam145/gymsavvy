class ProgramsController < ApplicationController


  def index
    @programs = Program.all
  end


  def show
    @program = Program.find(params[:id])
    @programs = Program.find(:all, conditions: { program_number: @program.program_number }, order: "programs.sequence ASC")
  end

  def new
    @program = Program.new
    find_exercises
  end


  def edit
    @program = Program.find(params[:id])
    @programs = Program.find(:all, conditions: { program_number: @program.program_number }, order: "programs.sequence ASC")
    find_exercises

  end


  def create
    set_counter
    sequence = Sequence.last

        
    if params[:add_exercise]
      @add_exercises = Exercise.find(params[:add_exercise][:exercise_id].keys)
    end

    @programs = []

    if @add_exercises
      @add_exercises.each do |exercise|
        program = Program.new(params[:program])
        program.program_number = sequence.counter_field
        program.exercise = exercise
        program.save
        @programs << program
      end
     flash[:success] = "You have created a Program!!"
     redirect_to edit_program_path(@programs.first.id)
    else
      ####### ISSUE! if no info provided the new action errors out, needs to be fixed
      redirect_to new_program_path
    end

  end


  def update
    @program = Program.find(params[:id])
    @programs = Program.find(:all, conditions: { program_number: @program.program_number })

    if params[:add_exercise]
      @add_exercises = Exercise.find(params[:add_exercise][:exercise_id].keys)

      @new_programs = []

      if @add_exercises
        @add_exercises.each do |exercise|
          program = Program.new(params[:program])
          program.program_number = @program.program_number
          program.exercise = exercise
          program.save
          @new_programs << program
        end
          find_exercises
          redirect_to edit_program_path(@new_programs.first.id)
      else
        ####### ISSUE! if no info provided the new action errors out, needs to be fixed
  #      render action: "new" 
      end

    else
      redirect_to program_path(@programs.first.id)
    end 

##### THIS PART UPDATES THE PROGRAM RECORDS ######
    @params = params.except(:utf8, :authenticity_token, :_method, :commit, :action, :controller, :add_exercise, :id)
    @param_keys = params.except(:utf8, :authenticity_token, :_method, :commit, :action, :controller, :add_exercise, :id).keys

    @ids = []
    
    @param_keys.each do |param|
      if param.include? "prog"
        @ids << param.scan( /\d+$/ ).first        
      end
    end

    i=0

      while i < (@params.count)
        program = Program.find(@ids[i])
          if @params[@param_keys[i]][:program_id]
            program.destroy
          else
            program.update_attributes(params[@param_keys[i]])
            program.save
          end       
        i+=1
      end

  end


  def destroy
    @program = Program.find(params[:id])
    @program.destroy

  end


    def set_counter
      sql = "UPDATE sequences SET counter_field = LAST_INSERT_ID(counter_field + 1);"
      ActiveRecord::Base.connection.execute(sql)
    end

end
