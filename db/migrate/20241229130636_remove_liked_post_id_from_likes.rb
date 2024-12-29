class RemoveLikedPostIdFromLikes < ActiveRecord::Migration[7.2]
  def change
    remove_reference :likes, :liked_post, null: false, foreign_key: false
  end
end
