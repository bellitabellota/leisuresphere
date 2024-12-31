require "rails_helper"

RSpec.describe "Delete an image_post", type: :system do
  it "image_post is not displayed on Feed" do
    user = FactoryBot.create(:user)
    login_as(user)
    FactoryBot.create(:image_post, author_id: user.id)
    visit root_path

    expect(page).to have_css("img[src*='test_image_post_sunset.jpg']")

    click_on "Delete Image"
    expect(page).not_to have_css("img[src*='test_image_post_sunset.jpg']")
  end
end
