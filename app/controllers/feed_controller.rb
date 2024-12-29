class FeedController < ApplicationController
  def show
    @current_user_and_followee_ids = current_user.followees.pluck(:id) << current_user.id

    @text_posts = Post.includes({ author: :profile }, :likers, { comments: { commenter: :profile } })
                      .where(author_id: @current_user_and_followee_ids)

    @image_posts = ImagePost.includes({ author: :profile }, :likers, { comments: { commenter: :profile } })
                      .where(author_id: @current_user_and_followee_ids)

    @feed_items = (@text_posts + @image_posts).sort_by { |item| item.created_at }.reverse
  end
end
