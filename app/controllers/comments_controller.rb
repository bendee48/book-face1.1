class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.build(body: params[:comment][:body], user_id: current_user.id)

    if @comment.save
      flash.notice = "Comment posted."
      redirect_back(fallback_location: root_path)
    else
      flash.alert = @comment.errors[:body].join(',')
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    flash.alert = "Comment deleted."

    redirect_back fallback_location: root_path
  end
end
