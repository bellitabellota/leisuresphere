class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.date :birthday
      t.string :location
      t.text :interests
      t.string :avatar_url

      t.timestamps
    end
  end
end
