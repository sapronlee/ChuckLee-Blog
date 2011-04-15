class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  # 填充 sidebar 数据
  def fill_sidebar_data
    @categories = Category.recent.all
    @recent_posts = Post.recent.limit(5).all
    @recent_comments = Comment.recent.join_post.limit(5).all
    @recent_tags = Post.tag_counts_on(:tags).limit(10).all
  end
  
end
