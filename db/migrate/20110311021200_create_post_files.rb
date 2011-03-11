class CreatePostFiles < ActiveRecord::Migration
  def self.up
    create_table :post_files do |t|
      t.string :name, :null => false, :limit => 40
      t.string :description
      t.string :file_file_name, :null => false
      t.string :file_content_type
      t.integer :file_file_size
      t.datetime :file_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :post_files
  end
end
