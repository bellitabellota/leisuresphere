require "rails_helper"

RSpec.describe "Remove Like from a post", type: :system do
  context "when current_user removes his/her like from a post" do
    it "decreases the like count by 1" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, author_id: user.id)
      FactoryBot.create(:like, likeable_id: post.id, likeable_type: "Post", liker_id: user.id)

      login_as user
      visit root_path
      expect(page).to have_content("1 Likes")
      click_on "Remove Like"
      expect(page).to have_content("0 Likes")
    end
  end
end
