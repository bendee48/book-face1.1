class UsersController < ApplicationController
  helper_method :friends_already?
  
  def index
    @users = User.all
  end

  def show
    @user = User.includes(:friends).find(params[:id])
  end

  def friends_already?(friend)
    current_user.all_friends.include?(friend)
  end
end
