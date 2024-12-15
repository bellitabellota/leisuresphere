require 'rails_helper'

RSpec.describe "User-Like-Post associations", type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }
  let!(:like) { FactoryBot.create(:like, liker_id: user.id, liked_post_id: post.id) }

  context "when user likes a post" do
    it "user.liked_posts returns a collection that includes the post" do
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
      user_for_deletion.destroy

      expect(Like.where(liker_id: user_for_deletion.id)).to be_empty
    end
  end

  context "deleting a post" do
    it "deletes it's likes as well" do
      post_for_deletion = FactoryBot.create(:post)
      FactoryBot.create(:like, liked_post_id: post_for_deletion.id)
      post_for_deletion.destroy

      expect(Like.where(liked_post_id: post_for_deletion.id)).to be_empty
    end
  end
end
