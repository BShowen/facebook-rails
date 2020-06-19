class Friendship < ApplicationRecord    
    belongs_to :user
    belongs_to :friend, class_name: "User"
    
    validates :user, :friend_id, presence: true
    after_create :log_creation


    private
    def log_creation 
        puts "created a friendship"
    end
end
