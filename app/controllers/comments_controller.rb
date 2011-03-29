class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.new(params[:comment])
    if @comment.save
      redirect_to posts_path
    else
      render :new
    end
  end
end
