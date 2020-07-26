class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.likes.build(user_id: params[:user_id])

    if @post.save
      flash.notice = "Post liked!"
      redirect_back(fallback_location: root_path)
    else
      flash.notice = @post.errors[:likes].last
      redirect_back(fallback_location: root_path)
    end
  end
end
