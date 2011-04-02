class TagsController < ApplicationController
  
  before_filter :fill_sidebar_data, :only => [:index, :show]
  
  def index
    
  end
  
  def show
    @posts = Post.tagged_with(params[:name], :on => :tags).paginate(:page => params[:page], :per_page => Setting.page_size, :include => [:category])
  end
  
  private
  def fill_sidebar_data
    @categories = Category.find(:all)
    @recent_posts = Post.recent.find(:all, :limit => 5)
    @recent_comments = Comment.recent.find(:all, :limit => 5, :include => [:commentable])
    @tags = Post.tag_counts_on(:tags)
  end
end
