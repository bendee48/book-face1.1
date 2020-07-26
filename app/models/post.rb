class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable

  validates :body, presence: true
  validates_associated :comments
  validates_associated :likes, message: "Already liked."
end
