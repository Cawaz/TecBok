class UsersController < ApplicationController
  def show
    @q = current_user.posts.with_attached_cover_image.includes(:user).ransack(params[:q])
    @posts = @q.result(distinct: true).recent.page(params[:page]).per(8)
  end
end