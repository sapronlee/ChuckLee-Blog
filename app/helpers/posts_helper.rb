module PostsHelper
  # 生成自定义post链接
  # 例：/2011/03/22/1-mypost
  def slug_post_path(post)
    date = post.created_at
    post_path(:year => date.year, :month => date.strftime("%m"), :day => date.strftime("%d"), :slug => post.slug, :id => post.id)
  end
end
