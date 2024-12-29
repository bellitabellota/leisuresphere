class ImagePost < ApplicationRecord
  belongs_to :author, class_name: "User"

  has_many :comments, as: :commentable, dependent: :destroy

  has_many :likes, as: :likeable, dependent: :destroy
  has_many :likers, through: :likes

  has_one_attached :body, dependent: :destroy
    validates :body, content_type: [ :png, :jpg, :jpeg ]
end
