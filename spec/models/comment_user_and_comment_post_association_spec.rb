require "rails_helper"

RSpec.describe "Comment-User and Comment-Post associations" do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }
  let!(:comment) { FactoryBot.create(:comment, commentable_id: post.id, commentable_type: "Post", commenter_id: user.id) }

  context "when a user creates a comment" do
    it "user.comments returns a collection that includes the comment" do
      expect(user.comments).to include(comment)
    end

    it "post.comments returns a collection that includes the comment" do
      expect(post.comments).to include(comment)
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

  context "deleting a post" do
    it "deletes it's comments as well" do
      post_for_deletion = FactoryBot.create(:post)
      FactoryBot.create(:comment, commentable_id: post_for_deletion.id, commentable_type: "Post")
      expect(Comment.where(commentable_id: post_for_deletion.id, commentable_type: "Post")).not_to be_empty
      post_for_deletion.destroy

      expect(Comment.where(commentable_id: post_for_deletion.id, commentable_type: "Post")).to be_empty
    end
  end
end
