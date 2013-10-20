class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|

    	t.integer "user_id"
    	t.integer "exercise_id"
    	t.integer "sequence"
      t.integer "program_number"
      t.integer "rating"
    	t.string "name"
      t.string "description"
      t.string "type"
      t.integer "reps"
      t.integer "sets"
      t.integer "rest_time"
      t.integer "weight"
      t.integer "distance"

      t.timestamps
    end

    add_index :programs, [:user_id, :exercise_id]
  end
end
