class UsersController < ApplicationController
  def show
    @q = Post.with_attached_cover_image.includes(:user).where(user_id: current_user.id).ransack(params[:q])
    @posts = @q.result(distinct: true).recent.page(params[:page]).per(8)
  end
end