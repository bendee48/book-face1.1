class UsersController < ApplicationController
  helper_method :friends_already?

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.includes(:friends).find(params[:id])
    @post = Post.new
    @posts = @user.posts.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
    @comment = Comment.new
  end
end
