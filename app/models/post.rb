class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :likes

  # validate the prescence of an author, title, and body
  validates :author, :title, :body, presence: true 
end
