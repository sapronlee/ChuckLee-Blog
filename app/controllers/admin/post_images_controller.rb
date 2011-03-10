# coding : utf-8
class Admin::PostImagesController < Admin::ApplicationController
  
  def new
    @image = PostImage.new
    render :layout => "window"
  end
  
  def create
    @image = PostImage.new(params[:post_image])
    if @image.save
      render :text => "上传成功！"
    else
      render :new
    end
  end
  
end
