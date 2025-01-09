require "rails_helper"

RSpec.describe "Remove Like from a post", type: :system do
  context "when current_user removes his/her like from a post" do
    it "decreases the like count by 1" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, author_id: user.id)
      FactoryBot.create(:like, likeable_id: post.id, likeable_type: "Post", liker_id: user.id)

      login_as user
      visit root_path
      within(".like-container") do
        expect(page).to have_content("1")
        find('form.button_to').find('button[type="submit"]').click
        expect(page).to have_content("0")
      end
    end
  end

  context "when current_user removes his/her like from an image post" do
    it "decreases the like count by 1" do
      user = FactoryBot.create(:user)
      image_post = FactoryBot.create(:image_post, author_id: user.id)
      FactoryBot.create(:like, likeable_id: image_post.id, likeable_type: "ImagePost", liker_id: user.id)

      login_as user
      visit root_path
      within(".like-container") do
        expect(page).to have_content("1")
        find('form.button_to').find('button[type="submit"]').click
        expect(page).to have_content("0")
      end
    end
  end
end
