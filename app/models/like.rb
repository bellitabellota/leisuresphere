class Like < ApplicationRecord
  belongs_to :liked_post, class_name: "Post"
  belongs_to :liker, class_name: "User"
end
