require "rails_helper"

RSpec.describe "Delete an image_post", type: :system do
  it "image_post is not displayed on 'My Profile'" do
    user = FactoryBot.create(:user)
    login_as(user)
    FactoryBot.create(:image_post, author_id: user.id)
    visit profile_path(user.profile.id)

    expect(page).to have_css("img[src*='test_image_post_sunset.jpg']")
    find("img.menu").click
    click_on "Delete Image"
    expect(page).not_to have_css("img[src*='test_image_post_sunset.jpg']")
  end
end
