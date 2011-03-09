# coding : utf-8
class Admin::PostsController < Admin::ApplicationController  
  def index
    @posts = Post.paginate :page => params[:page], :per_page => Setting.page_size
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
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to(admin_posts_path, :notice => "操作成功！")
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to(admin_posts_path, :notice => "操作成功！")
    else
      redirect_to(admin_posts_path, :notice => "操作失败！")
    end
  end
  
  def search
    @posts = Post.paginate(
    :conditions => ["ucase(`title`) like concat('%',ucase(?),'%')", params[:name]],
    :per_page => Setting.page_size,
    :page => params[:page])
    
    render :index
  end
  
  def destroy_selected
    if !params[:grid].blank?
      Post.destroy_all(:id => params[:grid][:selected])
      redirect_to(admin_posts_path, :notice => "操作成功！")      
    end   
  end
end
