class PostsController < ApplicationController
  def index
    @posts = Post.all
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
  end

  private
  def post_params
    params.require(:post).permit(:title, :review, :rate, :image)
  end
end
