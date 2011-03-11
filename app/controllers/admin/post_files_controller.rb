class Admin::PostFilesController < Admin::ApplicationController
  layout "window"  
  def new
    @file = PostFile.new
  end
  
  def create        
    @file = PostFile.new(params[:post_file])
    if @file.save
      render :text => "success"
    else
      render :new
    end      
  end
end
