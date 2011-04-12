# coding : utf-8
class Post < ActiveRecord::Base
  # 添加tags
  acts_as_taggable
  # 添加comments
  acts_as_commentable
  
  belongs_to :category, :counter_cache => true
  
  scope :recent, :order => "created_at desc"
  scope :join_category, :select => "posts.*, categories.alias as category_alias, categories.name as category_name", :joins => :category
  
  validates_presence_of :title, :body, :slug
  validates_presence_of :category_id, :message => "必须选择分类"
  validates_length_of :title, :in => 1..100 
  validates_format_of :slug, :with => /\A([a-zA-Z]([a-zA-Z0-9]|(-))*)\Z/, 
    :message => "格式错误"
    
  before_save :format_post
  def format_post
    self.summary.strip_html(['br', 'p']) if !self.summary.blank? 
  end
  
  def to_param
    "#{id}-#{slug}"
  end
end
