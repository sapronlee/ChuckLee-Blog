class AddAliasToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :alias, :string, :limit => 50
  end

  def self.down
    remove_column :categories, :alias
  end
end
