require 'rails_helper'

RSpec.describe "Post-User associations", type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author_id: user.id) }

  context "querying the post's author" do
    it "returns the author of the post" do
      expect(post.author).to eq(user)
    end
  end

  context "querying a user's posts" do
    it "returns a collection that includes the post of the user" do
      expect(user.posts).to include(post)
    end
  end

  context "deleting a user" do
    it "deletes his/her authored posts as well" do
      user_for_deletion = FactoryBot.create(:user)
      FactoryBot.create(:post, author_id: user_for_deletion.id)
      user_for_deletion.destroy

      expect(Post.where(author_id: user_for_deletion.id)).to be_empty
    end
  end
end
