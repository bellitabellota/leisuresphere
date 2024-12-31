require "rails_helper"

RSpec.describe "Update the user's profile", type: :system do
  it "displays the profile page with the updated profile" do
    user = FactoryBot.create(:user)
    login_as(user)
    visit edit_profile_path(user.profile)

    fill_in "Birthday", with: "09/09/2009"
    fill_in "Place of Residence", with: "Test Location"
    fill_in "Interests", with: "Tests Interests"
    attach_file "profile_profile_picture", Rails.root.join("spec/support/assets/test_image_post.png")
    click_on "Update Profile"

    expect(page).to have_css("img[src*='test_image_post.png']")
    expect(page).to have_content("2009-09-09")
    expect(page).to have_content("Test Location")
    expect(page).to have_content("Tests Interests")
  end
end
