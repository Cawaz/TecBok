class PostsController < ApplicationController
  def index
    @q = Post.all.ransack(params[:q])
    @posts = @q.result(distinct: true).recent.page(params[:page]).per(8)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    @categories = Category.all
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(post_params)
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
    params.require(:post).permit(:title, :review, :rate, :image, category_ids: [])
  end
end
