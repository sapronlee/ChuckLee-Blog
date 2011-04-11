# coding : utf-8
class Category < ActiveRecord::Base
  has_many :posts
  validates_presence_of :name, :alias
  validates_length_of :name, :alias, :in => 1..20
  validates_format_of :alias, :with => /\A([a-zA-Z]([a-zA-Z0-9]|(-)|(_))*)\Z/, 
    :message => "格式错误"
  validates_length_of :description, :maximum => 200
  
  scope :recent, :order => "created_at desc"
end
