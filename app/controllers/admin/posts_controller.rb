# coding : utf-8
class Admin::PostsController < Admin::ApplicationController  
  def index
    
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to(admin_posts_path, :notice => "新的文章创建成功！")
    else
      render :new
    end
  end
end
