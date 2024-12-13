class FollowsController < ApplicationController
  def index
    @follows = Follow.where(follower_id: current_user.id)
  end

  def create
    @follow = Follow.new(followee_id: params[:followee_id], follower_id: params[:follower_id])

    if @follow.save
      flash[:success] = "Great, your are now following #{User.find(params[:followee_id]).name}!"
      redirect_to users_path
    else
      flash.now[:error] = "Your Follow Request coud not be processed."
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    redirect_to follows_path, status: :see_other
  end
end
