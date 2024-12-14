require "rails_helper"

RSpec.describe "User follows another user", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:another_user) { FactoryBot.create(:second_user) }

  before do
    login_as user
  end

  def follow_user(another_user)
    visit users_path
    find("form[action*='followee_id=#{another_user.id}'] button", text: 'Follow').click
  end

  it "the other user is removed from users#index view page" do
    follow_user(another_user)

    ## The following line ensures that the page is already re-loaded
    expect(page).to have_content "Great, your are now following #{another_user.name}!"

    expect(page).to have_no_selector("form[action*='followee_id=#{another_user.id}']")
  end

  it "the other user is listed on the follows#index view" do
    follow_user(another_user)
    visit follows_path

    expect(page).to have_content another_user.name
  end
end
