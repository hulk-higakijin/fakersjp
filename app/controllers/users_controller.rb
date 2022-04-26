class UsersController < ApplicationController
  def show
    @user = User.find_by(public_uid: params[:public_uid])
    @posts = @user.posts.reverse
  end
end
