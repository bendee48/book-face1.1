class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true

  validates_uniqueness_of :user_id, scope: [:likeable_type, :likeable_id], message: "Already liked!"
end
