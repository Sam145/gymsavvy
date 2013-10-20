class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
    	t.integer "program_id"
    	t.string "muscle_group"
    	t.string "name"
    	t.string "description"
    	t.string "option_types"

      t.timestamps
    end

    add_index :exercises, :program_id
  end
end
