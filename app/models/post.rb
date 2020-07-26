class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable

  validates :body, presence: true
  validates_associated :likes, message: "Already liked."
end
