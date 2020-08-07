class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user_id: params[:user_id])

    if @like.save
      flash.notice = "Post liked!"
      redirect_back(fallback_location: root_path)
    else
      flash.alert = @like.errors[:user_id].join(',')
      redirect_back(fallback_location: root_path)
    end
  end
end
