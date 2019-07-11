class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :move_to_index, only: %i[edit update destroy]
  before_action :authenticate_user!, except: %i[index show]


  def index
    @q = Post.with_attached_cover_image.includes(:user).all.ransack(params[:q])
    @posts = @q.result(distinct: true).recent.page(params[:page]).per(8)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @categories = Category.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path, notice: "登録しました。"
    else
      flash.now[:alert] = @post.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "更新しました。"
    else
      flash.now[:alert] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: "削除しました。"
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :review, :link, :rate, :cover_image, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    redirect_to root_path, alert: "投稿が存在しません。"
  end

  def move_to_index
    redirect_to root_path if user_signed_in? && current_user.id != @post.user_id
  end
end
