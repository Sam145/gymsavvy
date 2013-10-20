class AddSecondsToProgramsTable < ActiveRecord::Migration
  def up
  	add_column :programs, :seconds, :integer
  end

  def down
  	remove_column :programs, :seconds
  end
end
