class AddColumnsToProgramsTable < ActiveRecord::Migration
  def up
  	add_column :programs, :hours, :integer
  	add_column :programs, :minutes, :integer
  end

  def down
  	remove_column :programs, :minutes
  	remove_column :programs, :hours
  end
end
