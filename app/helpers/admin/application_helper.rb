module Admin::ApplicationHelper
  # 去除区域里面的内容的换行标记  
  def spaceless(&block)
    data = with_output_buffer(&block)
    data = data.gsub(/>\s+</,"><")
    data
  end
end
