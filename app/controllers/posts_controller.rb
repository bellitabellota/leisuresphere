class PostsController < ApplicationController
  def index
    @all_posts = Post.includes(:author, :likers, :comments).all
    @posts = Post.where(author_id: current_user.id).or(Post.where(author_id: current_user.followees.pluck(:id))).order(created_at: :desc)
  end

  def new
    @post = current_user.posts.build()
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
