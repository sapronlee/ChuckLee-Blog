# encoding : utf-8
module LayoutHelper
  def title(page_title)
    content_for(:title) { "#{h(page_title.to_s)} | #{Setting.site_name}" }
  end
end