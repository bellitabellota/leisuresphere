require "rails_helper"

RSpec.describe "Create an ImagePost", type: :system do
  context "with valid input" do
    it "new image_post is displayed" do
      login_as(FactoryBot.create(:user))
      visit new_image_post_path
      attach_file "image_post_body", Rails.root.join("spec/support/assets/test_image_post.png")
      click_on "Post Image"
      expect(page).to have_css("img[src*='test_image_post.png']")
    end
  end

  context "with invalid input" do
    it "'invalid content type' error message is displayed" do
      login_as(FactoryBot.create(:user))
      visit new_image_post_path
      attach_file "image_post_body", Rails.root.join("spec/support/assets/invalid_image_format.gif")
      click_on "Post Image"
      expect(page).to have_content("Body has an invalid content type")
    end
  end

  context "without selecting any image" do
    it "the new#view is rendered again" do
    # As no image_post params gets send when submitting the form without selecting any image
    # the validations do not get called and no error message gets displayed.
    # Thus this test case checks that the new#view rather than the root page gets displayed.
    login_as(FactoryBot.create(:user))
    visit new_image_post_path
    click_on "Post Image"
    expect(page).to have_content("Upload a new image")
    end
  end
end
