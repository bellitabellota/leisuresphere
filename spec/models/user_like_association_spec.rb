require 'rails_helper'

RSpec.describe "User-Like association", type: :model do
  # except for the dependent destroy the User-Like association is well tested in:
  # user_like_image_post_spec.rb
  # user.like_post_associations_spec.rb

  context "deleting a user" do
    it "deletes his/her likes as well" do
      user_for_deletion = FactoryBot.create(:user)
      FactoryBot.create(:like, liker_id: user_for_deletion.id)
      expect(Like.where(liker_id: user_for_deletion.id)).not_to be_empty
      user_for_deletion.destroy

      expect(Like.where(liker_id: user_for_deletion.id)).to be_empty
    end
  end
end
