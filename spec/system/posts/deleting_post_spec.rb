require "rails_helper"

RSpec.describe "Delete a post", type: :system do
  it "post is not displayed on Feed" do
    user = FactoryBot.create(:user)
    login_as(user)
    FactoryBot.create(:post, author_id: user.id, body: "This is an new post")
    visit root_path
    click_on "Delete Post"
    expect(page).not_to have_content("This is a new post")
  end
end
