class Blog::PostsController < Blog::ApplicationController
  before_filter :fill_sidebar_data, :only => [:index, :show]
  
  def index
    @posts = Post.recent.join_category.page(params[:page]).per(Setting.page_size)
  end
  
  def show
    @post = Post.join_category.find(params[:id])
  end  
end
