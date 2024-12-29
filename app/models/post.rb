class Post < ApplicationRecord
  belongs_to :author, class_name: "User"

  has_many :likes, as: :likeable, dependent: :destroy
  has_many :likers, through: :likes

  has_many :comments, as: :commentable, dependent: :destroy

  validates :body, presence: true
end
