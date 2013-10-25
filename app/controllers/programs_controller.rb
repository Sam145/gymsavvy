class ProgramsController < ApplicationController
  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all

     #   respond_to do |format|
     #     format.html # index.html.erb
     #     format.json { render json: @programs }
     #   end
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    @program = Program.find(params[:id])
    @programs = Program.find(:all, conditions: { program_number: @program.program_number }, order: "programs.sequence ASC")

      # respond_to do |format|
      #    format.html # show.html.erb
      # format.json { render json: @program }
      #  end
  end

  # GET /programs/new
  # GET /programs/new.json
  def new
    @program = Program.new
    find_exercises

#    respond_to do |format|
#      format.html # new.html.erb
#      format.json { render json: @program }
#    end
  end

  # GET /programs/1/edit
  def edit
    @program = Program.find(params[:id])
    @programs = Program.find(:all, conditions: { program_number: @program.program_number }, order: "programs.sequence ASC")
    find_exercises

  end

  # POST /programs
  # POST /programs.json
  def create
    set_counter
    sequence = Sequence.last
#    sequence = Sequence.find(1)
#    program_number = sequence.counter_field
        
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




  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program = Program.find(params[:id])
    @program.destroy

#    respond_to do |format|
#      format.html { redirect_to programs_url }
#      format.json { head :no_content }
#    end
  end


    def set_counter
      sql = "UPDATE sequences SET counter_field = LAST_INSERT_ID(counter_field + 1);"
      ActiveRecord::Base.connection.execute(sql)
    end

end
