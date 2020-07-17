class FriendRequestsController < ApplicationController
  def index
    @user = User.includes(:request_users).find(current_user.id)
  end

  def create
    @user = User.find(current_user.id)
    @friend = User.find(params[:friend_id])

    @friend.request_users << @user

    redirect_to root_path
  end
end
