class LikesController < ApplicationController
  def create
    if params[:comment_id]
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:comment_id])
      current_user.like!(@comment) if @comment
    elsif params[:post_id]
      @post = Post.find(params[:post_id])
      current_user.like!(@post) if @post
    end
  end
  

  def destroy
    if params[:comment_id]
      @post = Post.find_by(id: params[:post_id])
      @comment = Comment.find_by(id: params[:comment_id])
      current_user.likes.where(likeable_id: @comment.id, likeable_type: @comment.class.name).delete_all
    elsif params[:post_id]
        @post = Post.find_by(id: params[:post_id])
        current_user.likes.where(likeable_id: @post.id, likeable_type: @post.class.name).delete_all
    end
   end
end