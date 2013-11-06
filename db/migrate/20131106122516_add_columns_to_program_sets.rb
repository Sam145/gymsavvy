class AddColumnsToProgramSets < ActiveRecord::Migration
  def up
  	add_column :program_sets, :public, :boolean, default: false
  	add_column :program_sets, :rating, :integer
  	add_column :program_sets, :grade, :string
  end

  def down
  	remove_column :program_sets, :grade, :string
  	remove_column :program_sets, :rating
  	remove_column :program_sets, :public
  end
end
