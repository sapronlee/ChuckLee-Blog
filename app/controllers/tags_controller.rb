class TagsController < ApplicationController
  
  before_filter :fill_sidebar_data, :only => [:index, :show]
  
  def index
    @tags = Post.tag_counts_on(:tags)
  end
  
  def show
    @posts = Post.join_category.tagged_with(params[:name], :on => :tags).page(params[:page]).per(Setting.page_size)
  end
  
end
