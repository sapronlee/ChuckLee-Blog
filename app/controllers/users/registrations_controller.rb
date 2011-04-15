class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :cancel ]
  layout "admin"
  
  # 当用户更新资料成功后跳转的url地址
  def after_update_path_for(resource)
    admin_root_path
  end
  
  # 当新用户注册成功后跳转的url地址
  def after_inactive_sign_up_path_for(resource)
    admin_root_path
  end
end