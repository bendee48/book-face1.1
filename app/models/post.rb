class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  validates :body, presence: true
  validates_associated :comments
  validates_associated :likes, message: "Already liked."
  validate :accept_image

  def self.posts_of_user_and_friends(user)
    where(user_id: user.friend_ids << user.id).order(created_at: :desc)
  end

  def accept_image
    return unless photo.attached?

    accepted_types = ['image/jpeg', 'image/png']
    unless accepted_types.include?(photo.content_type)
      errors.add(:photo, 'must be a JPG or PNG.')
    end
  end
end
