class RemoveProgramIdFromExerciseTable < ActiveRecord::Migration
  def up
  	remove_column :exercises, :program_id
  end

  def down
  	add_column :exercises, :program_id
  end
end
