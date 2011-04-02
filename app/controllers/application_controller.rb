class ApplicationController < ActionController::Base
  protect_from_forgery
  theme :theme_resolver
  
  
  private
  
  def theme_resolver
    "default"
  end
  
  def fill_sidebar_data
    @categories = Category.order("id desc")
    @recent_posts = Post.recent.limit(5)
    @recent_comments = Comment.recent.limit(5)    
    @tags = Post.tag_counts_on(:tags)
  end
end
