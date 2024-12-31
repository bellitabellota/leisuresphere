require "rails_helper"

RSpec.describe "Create a comment using button on Feed page", type: :system do
  context "comment on post with valid input" do
    it "new comment is displayed" do
      user = FactoryBot.create(:user)
      FactoryBot.create(:post, author_id: user.id)

      login_as(user)
      visit root_path
      click_on "Add Comment"
      fill_in "comment_body", with: "This is a new comment."
      click_on "Create Comment"
      expect(page).to have_content("This is a new comment.")
    end
  end

  context "comment on post with invalid input" do
    it "error message is displayed" do
      user = FactoryBot.create(:user)
      FactoryBot.create(:post, author_id: user.id)

      login_as(user)
      visit root_path
      click_on "Add Comment"
      click_on "Create Comment"
      expect(page).to have_content("Body can't be blank")
    end
  end

  context "comment on image post with valid input" do
    it "new comment is displayed" do
      user = FactoryBot.create(:user)
      FactoryBot.create(:image_post, author_id: user.id)

      login_as(user)
      visit root_path
      click_on "Add Comment"
      fill_in "comment_body", with: "This is a new comment."
      click_on "Create Comment"
      expect(page).to have_content("This is a new comment.")
    end
  end

  context "comment on image post with invalid input" do
    it "error message is displayed" do
      user = FactoryBot.create(:user)
      FactoryBot.create(:image_post, author_id: user.id)

      login_as(user)
      visit root_path
      click_on "Add Comment"
      click_on "Create Comment"
      expect(page).to have_content("Body can't be blank")
    end
  end
end
