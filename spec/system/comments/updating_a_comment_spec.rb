require "rails_helper"

RSpec.describe "Update a comment using button on Feed page", type: :system do
  context "update comment on post with valid input" do
    it "updated comment is displayed" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, author_id: user.id)
      FactoryBot.create(:comment, commenter_id: user.id, commentable_id: post.id, commentable_type: "Post", body: "A comment to be updated.")

      login_as(user)
      visit root_path
      click_on "Edit"
      fill_in "comment_body", with: "This is an updated comment."
      click_on "Update Comment"
      expect(page).to have_content("This is an updated comment.")
    end
  end

  context "update comment on post with invalid input" do
    it "error message is displayed" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, author_id: user.id)
      FactoryBot.create(:comment, commenter_id: user.id, commentable_id: post.id, commentable_type: "Post", body: "A comment to be updated.")

      login_as(user)
      visit root_path
      click_on "Edit"
      fill_in "comment_body", with: ""
      click_on "Update Comment"
      expect(page).to have_content("Body can't be blank")
    end
  end

  context "update comment on image_post with valid input" do
    it "updated comment is displayed" do
      user = FactoryBot.create(:user)
      image_post = FactoryBot.create(:image_post, author_id: user.id)
      FactoryBot.create(:comment, commenter_id: user.id, commentable_id: image_post.id, commentable_type: "ImagePost", body: "A comment to be updated.")

      login_as(user)
      visit root_path
      click_on "Edit"
      fill_in "comment_body", with: "This is an updated comment."
      click_on "Update Comment"
      expect(page).to have_content("This is an updated comment.")
    end
  end

  context "update comment on image_post with invalid input" do
    it "error message is displayed" do
      user = FactoryBot.create(:user)
      image_post = FactoryBot.create(:image_post, author_id: user.id)
      FactoryBot.create(:comment, commenter_id: user.id, commentable_id: image_post.id, commentable_type: "ImagePost", body: "A comment to be updated.")

      login_as(user)
      visit root_path
      click_on "Edit"
      fill_in "comment_body", with: ""
      click_on "Update Comment"
      expect(page).to have_content("Body can't be blank")
    end
  end
end
