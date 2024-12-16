class Post < ApplicationRecord
  belongs_to :author, class_name: "User"

  has_many :likes, foreign_key: :liked_post_id, dependent: :destroy
  has_many :likers, through: :likes

  has_many :comments, dependent: :destroy

  validates :body, presence: true
end
