class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes do |t|
      t.references :liked_post, null: false, foreign_key: { to_table: :posts }
      t.references :liker, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
