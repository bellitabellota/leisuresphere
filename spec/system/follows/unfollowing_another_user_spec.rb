require "rails_helper"

RSpec.describe "User unfollows another user", type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:another_user) { FactoryBot.create(:second_user) }
  let!(:follow) { FactoryBot.create(:follow, followee_id: another_user.id, follower_id: user.id) }

  before do
    login_as user
  end

  def unfollow_user(follow)
    visit follows_path
    accept_alert do
     find("form[action*='follows/#{follow.id}'] button", text: 'Unfollow').click
    end
  end

  it "the other user is removed from follows#index view page" do
    unfollow_user(follow)

    expect(page).to have_no_selector("form[action*='follows/#{follow.id}'] button", text: 'Unfollow')
  end

  it "the other user is listed on the user#index view page" do
    unfollow_user(follow)
    visit users_path

    expect(page).to have_content another_user.name
  end
end
