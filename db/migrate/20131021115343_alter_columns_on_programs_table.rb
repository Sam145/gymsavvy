class AlterColumnsOnProgramsTable < ActiveRecord::Migration
  def up
  	add_column :programs, :program_set_id, :integer
  end

  def down
  	remove_column :programs, :program_set_id
  end

end
