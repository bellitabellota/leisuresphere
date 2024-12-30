require "rails_helper"

RSpec.describe "Comment-ImagePost associations" do
  let(:image_post) { FactoryBot.create(:image_post) }
  let!(:comment) { FactoryBot.create(:comment, commentable_id: image_post.id, commentable_type: "ImagePost") }

  context "when a comment is created for an image post" do
    it "image_post.comments returns a collection that includes the comment" do
      expect(image_post.comments).to include(comment)
    end

    it "comment.commentable returns the image post" do
      expect(comment.commentable).to eq(image_post)
    end
  end

  context "deleting an image post" do
    it "deletes it's comments as well" do
      image_post_for_deletion = FactoryBot.create(:image_post)
      FactoryBot.create(:comment, commentable_id: image_post_for_deletion.id, commentable_type: "ImagePost")
      expect(Comment.where(commentable_id: image_post_for_deletion.id, commentable_type: "ImagePost")).not_to be_empty
      image_post_for_deletion.destroy

      expect(Comment.where(commentable_id: image_post_for_deletion.id, commentable_type: "ImagePost")).to be_empty
    end
  end
end
