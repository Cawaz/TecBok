class UsersController < ApplicationController
  def show
    @posts = current_user.posts.page(params[:page]).per(8)
  end
end