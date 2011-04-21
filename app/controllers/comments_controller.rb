# encoding : utf-8
class CommentsController < ApplicationController
  respond_to :html, :js
  
  def create
    @comment = Comment.new(params[:comment])
    flash[:notice] = "感谢你的评论!" if @comment.save
    respond_with @comment, :layout => !request.xhr?
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.has_children?
      @comment.children.map { |c| c.destroy }
    end
    @comment.destroy
    respond_with @comment, :layout => !request.xhr?
  end
end
