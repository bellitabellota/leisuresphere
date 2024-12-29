class CommentsController < ApplicationController
  def new
    @commentable = find_commentable
    @comment = @commentable.comments.build
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)

    if @comment.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @commentable = find_commentable
    @comment = Comment.find(params[:id])
  end

  def update
    @commentable = find_commentable
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commenter_id)
  end

  def find_commentable
    params.each do | id_name, id_value |
      if id_name == "image_post_id"
       return ImagePost.find(id_value)

      elsif id_name == "post_id"
        return Post.find(id_value)
      end
    end
  end
end
