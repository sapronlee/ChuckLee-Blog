module PostsHelper
  # 生成自定义post链接
  # 例：/2011/03/22/1-mypost
  def slug_post_path(post)
    date = post.created_at
    post_path(:year => date.year, :month => date.strftime("%m"), :day => date.strftime("%d"), :slug => post.slug, :id => post.id)
  end
  
  def tags_link(post)
    result = ""
    tags = post.cached_tag_list.split(",")
    tags.each_with_index do |t, i|
      result += "<a href=\"#\" title=\"#{t.strip}\">#{t.strip}</a>"
      result += "<span>,</span>" if i != tags.length - 1
    end
    return raw result
  end
end
