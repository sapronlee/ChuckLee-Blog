class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  # 填充 sidebar 数据
  def fill_sidebar_data
    @categories = Category.recent
    @recent_posts = Post.recent.limit(5)
    @recent_comments = Comment.recent.join_post.limit(5)
    @tags = Post.tag_counts_on(:tags)
  end
end
