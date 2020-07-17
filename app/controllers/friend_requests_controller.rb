class FriendRequestsController < ApplicationController
  def create
    @user = User.find(current_user.id)
    @friend = User.find(params[:friend_id])
    @friend_request =  

    @user.friend_requests << @friend

    redirect_to root_path
  end
end
