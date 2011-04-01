# coding : utf-8
class Post < ActiveRecord::Base
  # 添加tags
  acts_as_taggable
  # 添加comments
  acts_as_commentable
  belongs_to :category, :counter_cache => true
  scope :recent, :order => "id desc"
  
  before_save :format_post  
  
  validates_presence_of :title, :body, :slug
  validates_presence_of :category_id, :message => "必须选择分类"
  validates_length_of :title, :in => 1..100 
  validates_format_of :slug, :with => /\A([a-zA-Z]([a-zA-Z0-9]|(-))*)\Z/, 
    :message => "格式错误"
    
    
  def format_post
    self.summary.strip_html(['br', 'p']) if !self.summary.blank? 
  end
end
