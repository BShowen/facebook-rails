class Friendship < ApplicationRecord    
    belongs_to :friend, class_name: "User"
    belongs_to :user
    
    validates :user, :friend_id, presence: true
    after_create :log_creation


    private
    def log_creation 
        puts "created a friendship"
    end
end