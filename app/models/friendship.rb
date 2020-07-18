class Friendship < ApplicationRecord
  belongs_to :friend, foreign_key: :friend_id, class_name: 'User'
  belongs_to :friend_of, foreign_key: :friend_of_id, class_name: 'User'

  validates :friend, uniqueness: { scope: :friend_of_id, message: "Already friends." }
  validates :friend_of, uniqueness: { scope: :friend_id, message: "Already friends." }
end
