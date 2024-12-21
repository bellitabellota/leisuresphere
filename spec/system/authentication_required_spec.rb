require "rails_helper"

RSpec.describe "Request authentication to visit site", type: :system do
  context "when unauthenticated users visit homepage" do
    it "they are redirected to log in page" do
      visit root_path
      expect(page).to have_content "Log in"
    end
  end

  context "when users authenticate and visit homepage" do
    it "they are directed to the homepage" do
      user = FactoryBot.create(:user)

      login_as user
      visit root_path

      expect(page).to have_content "The social media platform to share all the little things you are passionate about!"
    end
  end
end
