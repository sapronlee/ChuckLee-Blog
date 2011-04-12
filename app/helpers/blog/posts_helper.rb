module Blog::PostsHelper
  # 自定义 blog post route
  def blog_slug_post_path(p)
    blog_post_path(:year => p.created_at.strftime("%Y"), 
                   :month => p.created_at.strftime("%m"), 
                   :day => p.created_at.strftime("%d"), 
                   :id => p.id, 
                   :slug => p.slug)
  end
  
  def post_path_for_comment(id, slug, created_at)
    blog_post_path(:year => created_at.strftime("%Y"), 
                   :month => created_at.strftime("%m"), 
                   :day => created_at.strftime("%d"), 
                   :id => id, 
                   :slug => slug)
  end
  
  # post 的 tags 列表
  def blog_tags_links(p)
    tags_html = []
    p.cached_tag_list.split(",").each do |t|
      tags_html << "<a href=\"#{tag_path(t.strip)}\" title=\"#{t.strip}\">#{t.strip}</a>"
    end
    raw tags_html.join(",")
  end
end
