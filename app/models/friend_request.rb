class FriendRequest < ApplicationRecord
  belongs_to :request, class_name: 'User', foreign_key: :friend_id
end
