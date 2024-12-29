require "rails_helper"

RSpec.describe "Like a post", type: :system do
  context "when current_user likes a post" do
    it "the like count increases by 1" do
      user = FactoryBot.create(:user)
      FactoryBot.create(:post, author_id: user.id)

      login_as user
      visit root_path
      expect(page).to have_content("0 Likes")
      click_on "Like"

      expect(page).to have_content("1 Likes")
    end
  end
end
