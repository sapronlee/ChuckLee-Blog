class Admin::RegistrationsController < Devise::RegistrationsController
  # 验证
  before_filter :authenticate_user!
  layout "admin"
  
  def index
    @users = User.paginate :page => params[:page], :per_page => Setting.page_size
  end
end