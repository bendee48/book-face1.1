class FriendRequest < ApplicationRecord
  belongs_to :request_user, class_name: 'User', foreign_key: :friend_id

  validates_uniqueness_of :user_id, scope: :friend_id, message: "Friend request already sent."
end

