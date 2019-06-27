class UsersController < ApplicationController
  def show
    @q = Post.where(user_id: current_user.id).ransack(params[:q])
    @posts = @q.result(distinct: true).recent.page(params[:page]).per(8)
  end
end