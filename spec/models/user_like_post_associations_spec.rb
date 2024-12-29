require 'rails_helper'

RSpec.describe "User-Like-Post associations", type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }
  let!(:like) { FactoryBot.create(:like, liker_id: user.id, likeable_id: post.id, likeable_type: "Post") }

  context "when user likes a post" do
    it "user.liked_posts returns a collection that includes the post" do
      p like
      expect(user.liked_posts).to include(post)
    end

    it "post.likers returns a collection that includes the user" do
      expect(post.likers).to include(user)
    end
  end

  context "deleting a user" do
    it "deletes his/her likes as well" do
      user_for_deletion = FactoryBot.create(:user)
      FactoryBot.create(:like, liker_id: user_for_deletion.id)
      expect(Like.where(liker_id: user_for_deletion.id)).not_to be_empty
      user_for_deletion.destroy

      expect(Like.where(liker_id: user_for_deletion.id)).to be_empty
    end
  end

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
