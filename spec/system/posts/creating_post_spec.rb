require "rails_helper"

RSpec.describe "Create a post", type: :system do
  context "with valid input" do
    it "new post is displayed" do
      login_as(FactoryBot.create(:user))
      visit new_post_path
      fill_in "post_body", with: "This is a new post"
      click_on "Create Post"
      expect(page).to have_content("This is a new post")
    end
  end

  context "with invalid input" do
    it "error message is displayed" do
      login_as(FactoryBot.create(:user))
      visit new_post_path
      click_on "Create Post"
      expect(page).to have_content("Body can't be blank")
    end
  end
end
