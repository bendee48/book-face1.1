class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:comment][:post_id])
    @post.comments.build(body: params[:comment][:body], user_id: current_user.id)

    if @post.save
      flash.notice = "Comment posted."
      redirect_back(fallback_location: root_path)
    else
      flash.notice = "AAAAAAAAAAAAAArgh"
      redirect_back(fallback_location: root_path)
    end
  end
end
