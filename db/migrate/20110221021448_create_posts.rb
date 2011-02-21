class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.references :category, :null => false
      t.string :title, :null => false, :limit => 100
      t.text :body, :null => false
      t.string :summary, :limit => 250
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
