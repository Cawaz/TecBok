class PostsController < ApplicationController
  def index
    @q = Post.all.ransack(params[:q])
    @posts = @q.result(distinct: true).recent.page(params[:page]).per(8)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(
        title: post_params[:title],
        review: post_params[:review], rate: post_params[:rate], image: post_params[:image], user_id: current_user.id)
    if post.save!
      redirect_to root_path, notice: "登録しました。"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post, notice: "更新しました。"
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to root_path, notice: "削除しました。"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :review, :rate, :image)
  end
end
