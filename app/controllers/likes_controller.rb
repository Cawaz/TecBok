class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(post: @post)
    if @like.save
      render :save
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find(params[:id])
    if @like.destroy
      render :save
    end
  end
end
