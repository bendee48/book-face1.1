class FriendRequest < ApplicationRecord
  belongs_to :request_user, class_name: 'User', foreign_key: :friend_id
end
