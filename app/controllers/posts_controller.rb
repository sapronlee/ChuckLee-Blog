class PostsController < ApplicationController  
  
  before_filter :fill_sidebar_data, :only => [:index, :show]
  
  def index
    @posts = Post.recent.paginate(:page => params[:page], :per_page => Setting.page_size, :include => [:category])    
  end
  
  def show
    @post = Post.find(params[:id], :include => [:category])    
  end
  
  private
  def fill_sidebar_data
    @categories = Category.find(:all)
    @recent_posts = Post.recent.find(:all, :limit => 5)
    @recent_comments = Comment.recent.find(:all, :limit => 5, :include => [:commentable])
  end
end
