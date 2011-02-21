class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name, :null => false, :limit => 50
      t.string :description
      t.integer :posts_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
