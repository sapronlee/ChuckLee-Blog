class CategoriesController < ApplicationController
  
  before_filter :fill_sidebar_data, :only => [:show]
  
  def show
    @posts = Post.join_category.where("categories.alias" => params[:alias]).page(params[:page]).per(Setting.page_size)
  end
  
end
