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

  context "when the followee is destroyed" do
    it "the associated follow is destroyed as well" do
      follower = FactoryBot.create(:user)
      followee_for_deletion = FactoryBot.create(:second_user)
      FactoryBot.create(:follow, followee_id: followee_for_deletion.id, follower_id: follower.id)
      followee_for_deletion.destroy

      expect(Follow.where(followee_id: followee_for_deletion.id)).to be_empty
    end
  end

  context "when the follower is destroyed" do
    it "the associated follow is destroyed as well" do
      follower_for_deletion = FactoryBot.create(:user)
      followee = FactoryBot.create(:second_user)
      FactoryBot.create(:follow, followee_id: followee.id, follower_id: follower_for_deletion.id)
      follower_for_deletion.destroy

      expect(Follow.where(follower_id: follower_for_deletion.id)).to be_empty
    end
  end
end
