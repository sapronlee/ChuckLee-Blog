class Admin::ApplicationController < ApplicationController
  # 验证
  before_filter :authenticate_user!
  layout "admin"
end
