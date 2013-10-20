class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|

    	t.integer :counter_field, default: 0, null: false

    end
  end
end
