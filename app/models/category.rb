class Category < ActiveRecord::Base
  has_many :posts
  validates_presence_of :name, :alias
  validates_length_of :name, :alias, :in => 1..20
  validates_length_of :description, :maximum => 200
end
