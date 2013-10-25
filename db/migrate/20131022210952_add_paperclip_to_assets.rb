class AddPaperclipToAssets < ActiveRecord::Migration
  def self.up
  	add_column :assets, :image_file_name, :string
  	add_column :assets, :image_content_type, :string
  	add_column :assets, :image_file_size, :string
  end

  def self.down
  	remove_column :assets, :image_file_name, :string
  	remove_column :assets, :image_content_type, :string
  	remove_column :assets, :image_file_size, :string
  end
end
