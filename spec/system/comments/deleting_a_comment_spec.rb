require "rails_helper"

RSpec.describe "Delete a comment using button on post#index page", type: :system do
  it "comment is not displayed on post#index" do
    user = FactoryBot.create(:user)
    post = FactoryBot.create(:post, author_id: user.id)
    FactoryBot.create(:comment, commenter_id: user.id, post_id: post.id, body: "A comment waiting for deletion.")

    login_as(user)
    visit root_path
    click_on "Delete Comment"
    expect(page).not_to have_content("A comment waiting for deletion.")
  end
end
