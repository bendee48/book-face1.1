require_relative '../validators/friend_request_validator'

class FriendRequest < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :request_user, class_name: 'User', foreign_key: :friend_id

  validates_with FriendRequestValidator
end
