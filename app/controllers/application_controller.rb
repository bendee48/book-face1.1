class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def friends_already?(friend)
    current_user.all_friends.include?(friend)
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_pic])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_pic])
    end
end
