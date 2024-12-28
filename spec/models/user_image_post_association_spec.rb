require 'rails_helper'

RSpec.describe "User-ImagePost associations", type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:image_post) { FactoryBot.create(:image_post, author_id: user.id) }

  context "querying the image_post's author" do
    it "returns the author of the image_post" do
      expect(image_post.author).to eq(user)
    end
  end

  context "querying a user's image_posts" do
    it "returns a collection that includes the image_post of the user" do
      expect(user.image_posts).to include(image_post)
    end
  end

  context "deleting a user" do
    it "deletes his/her authored image_posts as well" do
      user_for_deletion = FactoryBot.create(:user)
      FactoryBot.create(:image_post, author_id: user_for_deletion.id)
      user_for_deletion.destroy

      expect(ImagePost.where(author_id: user_for_deletion.id)).to be_empty
    end
  end
end
