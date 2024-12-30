require 'rails_helper'

RSpec.describe "User-Like-ImagePost associations", type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:image_post) { FactoryBot.create(:image_post, author_id: user.id) }
  let!(:like) { FactoryBot.create(:like, liker_id: user.id, likeable_id: image_post.id, likeable_type: "ImagePost") }

  context "when user likes an image post" do
    it "user.liked_image_posts returns a collection that includes the image post" do
      expect(user.liked_image_posts).to include(image_post)
    end

    it "image_post.likers returns a collection that includes the user" do
      expect(image_post.likers).to include(user)
    end
  end
end
