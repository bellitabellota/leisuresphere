require "rails_helper"

RSpec.describe "Update an ImagePost", type: :system do
  context "with valid input" do
    it "updated image_post is displayed" do
      user = FactoryBot.create(:user)
      login_as(user)
      image_post = FactoryBot.create(:image_post, author_id: user.id)

      visit edit_image_post_path(image_post)
      attach_file "image_post_body", Rails.root.join("spec/support/assets/test_image_post.png")
      click_on "Update Image"
      expect(page).to have_css("img[src*='test_image_post.png']")
    end
  end

  context "with invalid input" do
    it "'invalid content type' error message is displayed" do
      user = FactoryBot.create(:user)
      login_as(user)
      image_post = FactoryBot.create(:image_post, author_id: user.id)

      visit edit_image_post_path(image_post)
      attach_file "image_post_body", Rails.root.join("spec/support/assets/invalid_image_format.gif")
      click_on "Update Image"
      expect(page).to have_content("Body has an invalid content type")
    end
  end

  context "without selecting any image" do
    it "the edit#view is rendered again" do
    # As no image_post params gets send when submitting the form without selecting any image
    # the validations do not get called and no error message gets displayed.
    # Thus this test case checks that the edit#view rather than the root page gets displayed.
    user = FactoryBot.create(:user)
    login_as(user)
    image_post = FactoryBot.create(:image_post, author_id: user.id)

    visit edit_image_post_path(image_post)
    click_on "Update Image"
    expect(page).to have_content("Choose Another Image")
    end
  end
end
