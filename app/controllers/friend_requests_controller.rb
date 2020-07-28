class FriendRequestsController < ApplicationController
  def index
    @user = User.includes(:request_users).find(current_user.id)
  end

  def create
    @user = User.find(current_user.id)
    @friend = User.find(params[:friend_id])

    @friend.request_users << @user

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @user = User.find(params[:id])

    @user.request_users.destroy(User.find(params[:friend_id]))

    render :index
  end
end
