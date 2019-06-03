class PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page]).per(8)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save!
      redirect_to root_path, notice: "登録しました。"
    end
  end

  def edit
    @post = Post.find(params[:id])
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
