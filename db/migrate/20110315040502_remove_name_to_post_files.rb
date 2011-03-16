class RemoveNameToPostFiles < ActiveRecord::Migration
  def self.up
    remove_column :post_files, :name
  end

  def self.down
    add_column :post_files, :name, :string, :null => false, :limit => 40
  end
end
