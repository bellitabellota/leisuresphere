class RemovePostIdFromComments < ActiveRecord::Migration[7.2]
  def change
    remove_reference :comments, :post, null: false, foreign_key: false
  end
end
