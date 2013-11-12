class ChangeDescriptionTypeToText < ActiveRecord::Migration
	def up
	    change_column :program_sets, :description, :text
	end

	def down
	    change_column :program_sets, :description, :string
	end
end
