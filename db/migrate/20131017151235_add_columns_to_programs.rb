class AddColumnsToPrograms < ActiveRecord::Migration
  def up
  	add_column :programs, :distance_unit, :string
  	add_column :programs, :swim_distance_unit, :string
  	add_column :programs, :weight_unit, :string
  end

  def down
  	remove_column :programs, :weight_unit, :string
  	remove_column :programs, :swim_distance_unit, :string
  	remove_column :programs, :distance_unit, :string
  end
end
