class Friendship < ApplicationRecord    
    belongs_to :friend, class_name: "User"
    belongs_to :user
    validates :user, :friend_id, presence: true 
end
