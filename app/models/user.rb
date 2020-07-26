class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  has_many :friend_friendships, foreign_key: :friend_of_id, class_name: 'Friendship', dependent: :destroy
  has_many :friends, through: :friend_friendships, source: :friend
  
  has_many :friend_of_friendships, foreign_key: :friend_id, class_name: 'Friendship', dependent: :destroy
  has_many :friend_ofs, through: :friend_of_friendships, source: :friend_of

  has_many :friend_requests, dependent: :destroy
  has_many :request_users, through: :friend_requests, source: :request_user

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def all_friends
    friends + friend_ofs
  end

  def friend_ids
    all_friends.map { |user| user.id }
  end
end
