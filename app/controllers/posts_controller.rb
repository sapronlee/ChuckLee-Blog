class PostsController < ApplicationController  
  def index
    @posts = Post.paginate :page => params[:page], :per_page => Setting.page_size
    @categories = Category.find :all
  end
  
  def show
    @post = Post.find(params[:id])
  end
end
