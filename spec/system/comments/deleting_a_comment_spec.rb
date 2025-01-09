require "rails_helper"

RSpec.describe "Delete a comment using button on Feed page", type: :system do
  context "when deleting a comment of a post" do
    it "comment is not displayed on Feed" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, author_id: user.id)
      FactoryBot.create(:comment, commenter_id: user.id, commentable_id: post.id, commentable_type: "Post", body: "A comment waiting for deletion.")

      login_as(user)
      visit root_path
      click_on "Delete"
      expect(page).not_to have_content("A comment waiting for deletion.")
    end
  end

  context "when deleting a comment of an image post" do
    it "comment is not displayed on Feed" do
      user = FactoryBot.create(:user)
      image_post = FactoryBot.create(:image_post, author_id: user.id)
      FactoryBot.create(:comment, commenter_id: user.id, commentable_id: image_post.id, commentable_type: "ImagePost", body: "A comment waiting for deletion.")

      login_as(user)
      visit root_path
      click_on "Delete"
      expect(page).not_to have_content("A comment waiting for deletion.")
    end
  end
end
