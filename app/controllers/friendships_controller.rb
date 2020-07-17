class FriendshipsController < ApplicationController
  def create
    @user = User.find(current_user.id)
    @potential_friend = User.find(params[:user_id])

    @user.friends << @potential_friend

    @user.request_users.destroy(User.find(@potential_friend.id))

    redirect_to @user
  end
end
