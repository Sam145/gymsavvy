class AddCategoryToProgramSets < ActiveRecord::Migration

  def up
  	add_column :program_sets, :category, :string
  end

  def down
  	remove_column :program_sets, :category
  end


end
