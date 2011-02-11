# encoding : utf-8
module LayoutHelper
  def title(page_title)
    content_for(:title) { "#{Setting.site_name} | #{h(page_title.to_s)}" }
  end
end