class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice] = "success!"
    else
      flash[:notice] = "error!"
    end
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js
    end
  end
end
