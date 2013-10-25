class CreateProgramSets < ActiveRecord::Migration
  def change
    create_table :program_sets do |t|

    	t.integer :user_id
    	t.string :name
    	t.string :description

      t.timestamps
    end

    add_index :program_sets, :user_id
  end
end
