class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit]

  def show
    @user = User.find_by(public_uid: params[:public_uid])
    @posts = @user.posts.reverse
  end

  def edit
    @user = User.find_by(public_uid: params[:public_uid])
    @posts = @user.posts.reverse
    redirect_to user_path(current_user.public_uid) if @user.public_uid != current_user.public_uid
  end
end
