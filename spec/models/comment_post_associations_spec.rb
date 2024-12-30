require "rails_helper"

RSpec.describe "Comment-Post associations" do
  let(:post) { FactoryBot.create(:post) }
  let!(:comment) { FactoryBot.create(:comment, commentable_id: post.id, commentable_type: "Post") }

  context "when a comment is created for a post" do
    it "post.comments returns a collection that includes the comment" do
      expect(post.comments).to include(comment)
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
