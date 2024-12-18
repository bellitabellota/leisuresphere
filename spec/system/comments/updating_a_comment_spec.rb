require "rails_helper"

RSpec.describe "Update a comment using button on post#index page", type: :system do
  context "with valid input" do
    it "updated comment is displayed" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, author_id: user.id)
      FactoryBot.create(:comment, commenter_id: user.id, post_id: post.id, body: "A comment to be updated.")

      login_as(user)
      visit root_path
      click_on "Edit Comment"
      fill_in "comment_body", with: "This is an updated comment."
      click_on "Update Comment"
      expect(page).to have_content("This is an updated comment.")
    end
  end

  context "with invalid input" do
    it "error message is displayed" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, author_id: user.id)
      FactoryBot.create(:comment, commenter_id: user.id, post_id: post.id, body: "A comment to be updated.")

      login_as(user)
      visit root_path
      click_on "Edit Comment"
      fill_in "comment_body", with: ""
      click_on "Update Comment"
      expect(page).to have_content("Body can't be blank")
    end
  end
end
