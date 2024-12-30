require 'rails_helper'

RSpec.describe "Like-Post association", type: :model do
  # except for the dependent destroy the Like-Post association is well tested in:
  # user_like_image_post_spec.rb
  # user.like_post_associations_spec.rb
  context "deleting a post" do
    it "deletes it's likes as well" do
      post_for_deletion = FactoryBot.create(:post)
      FactoryBot.create(:like, likeable_id: post_for_deletion.id, likeable_type: "Post")
      expect(Like.where(likeable_id: post_for_deletion.id, likeable_type: "Post")).not_to be_empty
      post_for_deletion.destroy

      expect(Like.where(likeable_id: post_for_deletion.id, likeable_type: "Post")).to be_empty
    end
  end
end
