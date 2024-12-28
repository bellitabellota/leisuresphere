class ImagePost < ApplicationRecord
  belongs_to :author, class_name: "User"

  has_one_attached :body, dependent: :destroy
    validates :body, content_type: [ :png, :jpg, :jpeg ]
end
