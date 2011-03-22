# coding : utf-8
class Post < ActiveRecord::Base
  # 添加tags
  acts_as_taggable 
  belongs_to :category, :counter_cache => true
  
  validates_presence_of :title, :body
  validates_presence_of :category_id, :message => "必须选择分类"
  validates_length_of :title, :in => 1..100  
end
