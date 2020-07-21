require_relative '../validators/friendship_validator'

class Friendship < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :friend, foreign_key: :friend_id, class_name: 'User'
  belongs_to :friend_of, foreign_key: :friend_of_id, class_name: 'User'
  
  validates_with FriendshipValidator
end
