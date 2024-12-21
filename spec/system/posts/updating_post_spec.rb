require "rails_helper"

RSpec.describe "Update a post", type: :system do
  context "with valid input" do
    it "updated post is displayed" do
      user = FactoryBot.create(:user)
      login_as(user)
      post = FactoryBot.create(:post, body: "This is an new post", author_id: user.id)
      visit edit_post_path(post)
      fill_in "post_body", with: "This is an updated post"
      click_on "Update Post"
      expect(page).to have_content("This is an updated post")
    end
  end

  context "with invalid input" do
    it "error is displayed" do
      user = FactoryBot.create(:user)
      login_as(user)
      post = FactoryBot.create(:post, body: "This is an new post", author_id: user.id)
      visit edit_post_path(post)
      fill_in "post_body", with: ""
      click_on "Update Post"
      expect(page).to have_content("Body can't be blank")
    end
  end
end
