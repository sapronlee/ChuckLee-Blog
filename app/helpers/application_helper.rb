# coding : utf-8
module ApplicationHelper
  def auth_token
    result = <<-end 
      <div style=\"margin:0;padding:0;display:inline\">
        <input name=\"utf8\" type=\"hidden\" value=\"&#x2713;\" />
        <input name=\"authenticity_token\" type=\"hidden\" value=\"#{form_authenticity_token}\" />
      </div>
    end
    raw result
  end
  
  # 通用数据的编辑，删除链接
  # record：记录
  # :ns => 路由前缀
  # :line => 分割线
  def record_action_link(record, options = {})
    record_link = [options[:ns] || nil, record].compact
    result = <<-end
      #{link_to("编辑", edit_polymorphic_path(record_link))}
      #{options[:line] || "|"}
      #{link_to("删除", polymorphic_path(record_link), :method => :delete, :class => "delete")}
    end
    raw result    
  end
  
  # 当前controller和action的名字组合
  def current_controller_and_action_name
    "#{current_controller_name}_#{params[:action]}"
  end
  
  # 当前controller的名字
  def current_controller_name
    "#{params[:controller].gsub(/\//, "_")}"
  end
  
  def current_page?(controller = "", action = "")
    if action.blank?
      return params[:controller] == controller
    else
      return (params[:controller] == controller and params[:action] == action)
    end
  end
end
