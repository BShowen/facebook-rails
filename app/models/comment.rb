class Comment < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post

  # validate presence of body
  validates :body, presence: true
end
