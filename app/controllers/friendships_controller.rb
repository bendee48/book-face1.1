class FriendshipsController < ApplicationController
  def create
    @potential_friend = User.find(params[:user_id])
    @friendship = Friendship.new(friend_id: @potential_friend.id, friend_of_id: current_user.id)
    
    if @friendship.save
      flash.notice = "You are now friends with #{@potential_friend.name}"
      redirect_to current_user
    else
      flash.notice = "You are already friends."
      redirect_to current_user
    end

    #delete friend request
    current_user.request_users.destroy(User.find(@potential_friend.id))
  end

  def destroy
    @friendship = Friendship.find_by(friend_id: current_user.id, friend_of_id: params[:id]) ||
                  Friendship.find_by(friend_id: params[:id], friend_of_id: current_user.id)

    @friendship.destroy

    flash.notice = "Friend removed."

    redirect_back fallback_location: root_path
  end
end
