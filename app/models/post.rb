class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
  has_one_attached :photo

  validates :body, presence: true
  validates_associated :comments
  validates_associated :likes, message: "Already liked."

  def self.posts_of_user_and_friends(user)
    where(user_id: user.friend_ids << user.id).order(created_at: :desc)
  end
end
