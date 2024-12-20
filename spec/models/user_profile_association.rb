require 'rails_helper'

RSpec.describe "User-Profile association", type: :model do
  let!(:user) { FactoryBot.create(:user) }

  context "creating a user" do
    it "automatically creates a profile" do
      expect(user.profile).not_to be_nil
    end

    it "the created profile has an avatar_url" do
      expect(user.profile.avatar_url).not_to be_nil
    end
  end

  context "querying the profil's user" do
    it "returns the user" do
      profile = user.profile
      expect(profile.user).to eq(user)
    end
  end

  context "deleting a user" do
    it "deletes his/her authored profile as well" do
      user_for_deletion = FactoryBot.create(:user)
      user_for_deletion.destroy

      expect(Profile.where(user_id: user_for_deletion.id)).to be_empty
    end
  end
end
