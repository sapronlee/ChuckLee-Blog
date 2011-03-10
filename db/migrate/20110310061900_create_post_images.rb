class CreatePostImages < ActiveRecord::Migration
  def self.up
    create_table :post_images do |t|
      t.string :name, :null => false, :limit => 40
      t.string :description
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :post_images
  end
end
