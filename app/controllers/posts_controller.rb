class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).posts_of_user_and_friends(current_user)
    @comment = Comment.new
    @post = Post.new
    @user = current_user
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)

    if @post.save
      flash.notice = "Posted."
      redirect_back fallback_location: root_path
    else
      flash.alert = "Post failed. " + @post.errors.full_messages.first
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    flash.alert = "Post deleted"

    redirect_back fallback_location: root_path
  end

  private

  def post_params
    params.require(:post).permit(:body, :photo)
  end
end
