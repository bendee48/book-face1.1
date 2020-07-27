class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  validates :name, presence: true

  has_many :friend_friendships, foreign_key: :friend_of_id, class_name: 'Friendship', dependent: :destroy
  has_many :friends, through: :friend_friendships, source: :friend
  
  has_many :friend_of_friendships, foreign_key: :friend_id, class_name: 'Friendship', dependent: :destroy
  has_many :friend_ofs, through: :friend_of_friendships, source: :friend_of

  has_many :friend_requests, dependent: :destroy
  has_many :request_users, through: :friend_requests, source: :request_user

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :profile_pic

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.provider = auth.provider
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
    end
  end

  def all_friends
    friends + friend_ofs
  end

  def friend_ids
    all_friends.map { |user| user.id }
  end
end
