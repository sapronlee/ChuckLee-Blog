class Admin::PostFilesController < Admin::ApplicationController
  layout "window"  
  
  def index
     @files = PostFile.paginate :page => params[:page], :per_page => Setting.page_size
  end
  
  def new
    @file = PostFile.new
  end
  
  def create        
    @file = PostFile.new(params[:post_file])
    if @file.save
      render "add_text", :layout => nil
    else
      render :new
    end      
  end
  
  def destroy
    @file = PostFile.find(params[:id])
    @file.destroy
    redirect_to admin_post_files_path
  end
end
