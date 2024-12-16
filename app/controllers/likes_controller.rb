class LikesController < ApplicationController
  def create
    @like = Like.new(liked_post_id: params[:liked_post_id], liker_id: params[:liker_id])

    if @like.save
      redirect_to root_path
    else
      flash[:error] = "Your Like was not correctly processed."
      redirect_to root_path
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to root_path, status: :see_other
  end
end
