class AddTimeColumnToPrograms < ActiveRecord::Migration
  def up
  	add_column :programs, :time, :datetime
  end

  def down
  	remove_column :programs, :time
  end
end
