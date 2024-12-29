class ImagePostsController < ApplicationController
  def new
    @image_post = current_user.image_posts.build()
  end

  def create
    @image_post = current_user.image_posts.build(image_post_params)

    if @image_post.save
      redirect_to image_posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @image_post = ImagePost.find(params[:id])
  end

  def update
    @image_post = ImagePost.find(params[:id])

    if @image_post.update(image_post_params)
      redirect_to image_posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @image_post = ImagePost.find(params[:id])

    @image_post.destroy
    redirect_to image_posts_path, status: :see_other
  end

  private

  def image_post_params
    params.require(:image_post).permit(:body)
  end
end
