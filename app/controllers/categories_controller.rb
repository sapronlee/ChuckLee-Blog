class CategoriesController < ApplicationController
  
  before_filter :fill_sidebar_data, :only => [:show]
  
  def show
    @category = Category.find_by_alias(params[:alias])
    @posts = Post.where(:category_id => @category).paginate(:page => params[:page], :per_page => Setting.page_size, :include => [:category])    
  end
  
  private
  def fill_sidebar_data
    @categories = Category.find(:all)
    @recent_posts = Post.recent.find(:all, :limit => 5)
    @recent_comments = Comment.recent.find(:all, :limit => 5, :include => [:commentable])
    @tags = Post.tag_counts_on(:tags)
  end
end
