# coding : utf-8
class Post < ActiveRecord::Base
  # 添加tags
  acts_as_taggable 
  belongs_to :category, :counter_cache => true
  
  validates_presence_of :title, :body, :slug
  validates_presence_of :category_id, :message => "必须选择分类"
  validates_length_of :title, :in => 1..100 
  validates_format_of :slug, :with => /\A([a-zA-Z]([a-zA-Z0-9]|(-))*)\Z/, 
    :message => "格式错误"
end
