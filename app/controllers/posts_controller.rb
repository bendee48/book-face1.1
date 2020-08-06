class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).posts_of_user_and_friends(current_user)
    @comment = Comment.new
  end

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
    params.require(:post).permit(:body, :photo)
  end
end
