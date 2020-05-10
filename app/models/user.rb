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
end
