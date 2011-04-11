class Blog::PostsController < Blog::ApplicationController
  before_filter :fill_sidebar_data, :only => [:index, :show]
  
  def index
    @posts = Post.recent.joins(:category).category.page(params[:page]).per(Setting.page_size) 
  end
  
  def show
    @post = Post.joins(:category).category.find(params[:id])
  end  
end
