class PostsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)

    if @post.save
      flash.notice = "Posted."
      redirect_to @user
    else
      flash.notice = "Post failed. " + @post.errors.full_messages.first
      redirect_to @user
    end
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
