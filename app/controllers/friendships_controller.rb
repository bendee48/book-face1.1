class FriendshipsController < ApplicationController
  def create
    @user = User.find(current_user.id)
    @friend = User.find(params[:friend_id])

    @user.friends << @friend

    redirect_to @user
  end
end
