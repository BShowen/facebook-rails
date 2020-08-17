class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.already_liked?(user_id, post_id)
    return Like.where("user_id = ? AND post_id = ?", user_id, post_id).take
  end

  def self.delete_like(user_id, post_id)
    like = Like.where("user_id = ? AND post_id = ?", user_id, post_id).take
    like.destroy
    return nil
  end
end
