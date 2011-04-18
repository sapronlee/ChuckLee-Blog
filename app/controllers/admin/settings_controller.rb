# coding: utf-8
class Admin::SettingsController < Admin::ApplicationController
  
  def index  
  end
  
  def create
    psettings = params[:settings]
    psettings.each do |item|
      Setting["#{item[0]}"] = item[1]
    end
    
    redirect_to admin_settings_path, :notice => "保存成功！"
  end
  
end
