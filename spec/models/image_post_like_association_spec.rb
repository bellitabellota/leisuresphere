require 'rails_helper'

RSpec.describe "Like-ImagePost association", type: :model do
  # except for the dependent destroy the Like-ImagePost association is well tested in:
  # user_like_image_post_spec.rb
  context "deleting an image post" do
    it "deletes it's likes as well" do
      image_post = FactoryBot.create(:image_post)
      FactoryBot.create(:like, likeable_id: image_post.id, likeable_type: "ImagePost")
      expect(Like.where(likeable_id: image_post.id, likeable_type: "ImagePost")).not_to be_empty
      image_post.destroy

      expect(Like.where(likeable_id: image_post.id, likeable_type: "Image_Post")).to be_empty
    end
  end
end
