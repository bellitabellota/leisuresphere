require 'rails_helper'

RSpec.describe "Polymorphic User-Like-Likeable associations", type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:image_post) { FactoryBot.create(:image_post, author_id: user.id) }
  let!(:image_post_like) { FactoryBot.create(:like, liker_id: user.id, likeable_id: image_post.id, likeable_type: "ImagePost") }
  let(:post) { FactoryBot.create(:post) }
  let!(:post_like) { FactoryBot.create(:like, liker_id: user.id, likeable_id: post.id, likeable_type: "Post") }

  context "when a user likes an image post and a conventional text post" do
    it "post_like.likeable returns the post" do
      expect(post_like.likeable).to eq(post)
    end

    it "image_post_like.likeable returns the image_post" do
      expect(image_post_like.likeable).to eq(image_post)
    end

    it "user.likeables returns 2 results" do
      expect(user.likeables.count).to eq(2)
    end

    it "user.likeables includes post" do
      expect(user.likeables).to include(post)
    end

    it "user.likeables includes image_post" do
      expect(user.likeables).to include(image_post)
    end
  end
end
