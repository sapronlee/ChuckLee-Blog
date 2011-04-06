class Blog::PostsController < Blog::ApplicationController
  before_filter :fill_sidebar_data, :only => [:index, :show]
  
  def index
    @posts = Post.recent.joins(:category).select("posts.*, categories.alias as category_name").paginate(:page => params[:page], :per_page => Setting.page_size) 
  end
  
  def show
    @post = Post.where(:id => params[:id]).includes(:category).first
  end  
end
