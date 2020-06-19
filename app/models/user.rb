class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :profile
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes
  has_many :friend_requests_sent, class_name: "FriendRequest", foreign_key: :sender_id
  has_many :friend_requests_received, class_name: "FriendRequest", foreign_key: :receiver_id

  # if a profile exists, great. if not, create one. 
  before_validation { |user| user.profile || user.profile = Profile.new }
  

  validates :name, :profile, presence: true

  # has_many :friends, class_name: "Friendship", foreign_key: :user_id
  has_many :friendships
  has_many :friends, through: :friendships
end
