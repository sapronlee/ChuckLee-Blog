# coding : utf-8
class Admin::UsersController < Admin::ApplicationController
  
  def index
    @users = User.paginate :page => params[:page], :per_page => Setting.page_size
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(admin_users_path, :notice => "新的用户创建成功！")
    else
      render :new
    end
  end
  
  def edit
    @user = User.find params[:id]
  end
  
  def update
    @user = User.find params[:id]
    update_password(params[:user])
    if @user.update_attributes(params[:user])
      redirect_to(admin_users_path, :notice => "用户修改成功！")
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find params[:id]
    if @user.destroy
      redirect_to(admin_users_path, :notice => "分类删除成功！")
    else
      redirect_to(admin_users_path, :notice => "分类删除失败！")
    end
  end
  
  def search
    @users = User.paginate(
    :conditions => ["ucase(`login`) like concat('%',ucase(?),'%')", params[:login]],
    :per_page => Setting.page_size,
    :page => params[:page])
    
    render :index
  end
  
  private
  def update_password(params = {})
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
  end
end
