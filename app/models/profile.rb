class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_picture, dependent: :destroy
    validates :profile_picture, content_type: [ :png, :jpg, :jpeg ]
end
