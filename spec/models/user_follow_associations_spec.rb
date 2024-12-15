require "rails_helper"

RSpec.describe "User-Follow associations", type: :model do
  context "when second user follows user" do
    let(:user) { FactoryBot.create(:user) }
    let(:second_user) { FactoryBot.create(:second_user) }
    let!(:follow) { FactoryBot.create(:follow, followee: user, follower: second_user) }

    it "second user is one of user.followers" do
      expect(user.followers).to include(second_user)
    end

    it "user is one of second_user.followees" do
      expect(second_user.followees).to include(user)
    end
  end
end
