# coding : utf-8
class Admin::CategoriesController < Admin::ApplicationController
  def index
    @categories = initialize_grid(Category,
    
                                  :per_page => Setting.page_size)
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to(admin_categories_path, :notice => "新的分类创建成功！")
    else
      render :new
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to(admin_categories_path, :notice => "分类修改成功！")
    else
      render :edit
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to(admin_categories_path, :notice => "分类删除成功！")
    else
      redirect_to(admin_categories_path, :notice => "分类删除失败！")
    end
  end
end
