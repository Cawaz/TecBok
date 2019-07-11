class CommentsController < ApplicationController
  before_action :set_post, only: %i[create destroy]
  before_action :set_comment, only: %i[destroy]

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      render :index
    else
      flash.now[:alert] = @comment.errors.full_messages
      render :index
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id,)
  end
end
