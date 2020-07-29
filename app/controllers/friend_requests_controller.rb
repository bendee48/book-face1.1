class FriendRequestsController < ApplicationController
  def index
    @user = User.includes(:request_users).find(current_user.id)
  end

  def create
    @user = User.find(current_user.id)
    @friend = User.find(params[:friend_id])
    @friend_request = @user.friend_requests.build(friend_id: @friend.id)

    if @friend_request.save
      flash.notice = "Friend request sent."
      redirect_back(fallback_location: root_path)
    else
      flash.notice = "waaah"
      redirect_back(fallback_location: root_path)
    end    
  end

  def destroy
    @user = User.find(params[:id])

    @user.request_users.destroy(User.find(params[:friend_id]))

    render :index
  end
end
