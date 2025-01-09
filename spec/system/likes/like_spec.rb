require "rails_helper"

RSpec.describe "Like a post", type: :system do
  context "when current_user likes a post" do
    it "the like count increases by 1" do
      user = FactoryBot.create(:user)
      FactoryBot.create(:post, author_id: user.id)

      login_as user
      visit root_path
      within(".like-container") do
        expect(page).to have_content("0")
        find('form.button_to').find('button[type="submit"]').click
        expect(page).to have_content("1")
      end
    end
  end

  context "when current_user likes an image post" do
    it "the like count increases by 1" do
      user = FactoryBot.create(:user)
      FactoryBot.create(:image_post, author_id: user.id)

      login_as user
      visit root_path

      within(".like-container") do
        expect(page).to have_content("0")
        find('form.button_to').find('button[type="submit"]').click
        expect(page).to have_content("1")
      end
    end
  end
end
