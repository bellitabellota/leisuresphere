require 'rails_helper'

RSpec.describe "User-Like-Post associations", type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }
  let!(:like) { FactoryBot.create(:like, liker_id: user.id, likeable_id: post.id, likeable_type: "Post") }

  context "when user likes a post" do
    it "user.liked_posts returns a collection that includes the post" do
      expect(user.liked_posts).to include(post)
    end

    it "post.likers returns a collection that includes the user" do
      expect(post.likers).to include(user)
    end
  end
end
