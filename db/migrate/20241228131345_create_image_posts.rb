class CreateImagePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :image_posts do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
