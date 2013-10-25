class RemoveColumnsFromProgramsTable < ActiveRecord::Migration

  def up
  	remove_column :programs, :name
  	remove_column :programs, :description
  	remove_column :programs, :user_id
  	remove_column :programs, :program_number
  end

  def down
  	add_column :programs, :program_number, :integer
  	add_column :programs, :user_id, :integer
  	add_column :programs, :description, :string
  	add_column :programs, :name, :string
  end

end
