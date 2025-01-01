require "rails_helper"

RSpec.describe "Delete a user/user's account", type: :system do
  it "retry login fails" do
    user = FactoryBot.create(:user)
    login_as(user)
    visit profile_path(user.profile)
    click_on "Delete Account"
    accept_alert
    expect(page).to have_content("Log in")
    fill_in "Login", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    expect(page).to have_content("Invalid Login or password.")
  end
end
