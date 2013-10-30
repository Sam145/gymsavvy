class AddColumnToUsers < ActiveRecord::Migration

  def up
  	add_column :users, :mf, :boolean, default: true
  end

  def down
  	remove_column :users, :mf
  end

end
