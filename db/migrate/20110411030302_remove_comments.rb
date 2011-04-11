class RemoveComments < ActiveRecord::Migration
  def self.up
    drop_table :comments
  end

  def self.down
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.string :page
      t.text :comment
      t.references :commentable, :polymorphic => true
      t.timestamps
    end

    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
  end
end
