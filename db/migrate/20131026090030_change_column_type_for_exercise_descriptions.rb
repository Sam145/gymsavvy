class ChangeColumnTypeForExerciseDescriptions < ActiveRecord::Migration

def up
    change_column :exercises, :description, :text
end

def down
    change_column :exercises, :description, :string
end

end
