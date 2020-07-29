class FriendRequestsController < ApplicationController
  def index
    @user = User.includes(:request_users).find(current_user.id)
  end

  def create
    @friend = User.find(params[:friend_id])
    @friend_request = @friend.friend_requests.build(friend_id: current_user.id)

    if @friend_request.save
      flash.notice = "Friend request sent."
      redirect_back(fallback_location: root_path)
    else
      flash.notice = @friend_request.errors[:user_id].join(',')
      redirect_back(fallback_location: root_path)
    end    
  end

  def destroy
    @user = User.find(params[:id])

    @user.request_users.destroy(User.find(params[:friend_id]))

    render :index
  end
end
