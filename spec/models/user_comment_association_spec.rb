require "rails_helper"

RSpec.describe "User-Comment association" do
  let(:user) { FactoryBot.create(:user) }
  let!(:comment) { FactoryBot.create(:comment, commenter_id: user.id) }

  context "when a user creates a comment" do
    it "user.comments returns a collection that includes the comment" do
      expect(user.comments).to include(comment)
    end
  end

  context "when a user creates a comment" do
    it "comment.commenter returns the user" do
      expect(comment.commenter).to eq(user)
    end
  end

  context "deleting a user" do
    it "deletes his/her comments as well" do
      user_for_deletion = FactoryBot.create(:user)
      FactoryBot.create(:comment, commenter_id: user_for_deletion.id)
      user_for_deletion.destroy

      expect(Comment.where(commenter_id: user_for_deletion.id)).to be_empty
    end
  end
end
