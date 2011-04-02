class PostsController < ApplicationController  
  
  before_filter :fill_sidebar_data, :only => [:index, :show]
  
  def index
    @posts = Post.recent.includes(:category).paginate(:page => params[:page], :per_page => Setting.page_size)    
  end
  
  def show
    @post = Post.find(params[:id], :include => [:category])    
  end  
  
end
