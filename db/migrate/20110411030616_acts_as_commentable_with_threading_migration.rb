class ActsAsCommentableWithThreadingMigration < ActiveRecord::Migration
  def self.up
    create_table :comments, :force => true do |t|
      t.integer :commentable_id, :default => 0
      t.string :commentable_type, :default => ""
      t.string :user_name, :null => false
      t.text :body, :default => ""
      t.string :email, :default => ""
      t.string :web_site, :default => ""
      t.string :subject, :default => ""
      t.integer :parent_id, :lft, :rgt
      t.timestamps
    end
    
    # add_index :comments, :user_id
    add_index :comments, :commentable_id
  end
  
  def self.down
    drop_table :comments
  end
end
