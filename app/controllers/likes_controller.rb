class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_user.like!(@post)
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    current_user.likes.where(likeable_id: @post.id, likeable_type: @post.class.name).delete_all
  end
end