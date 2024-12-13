class FollowsController < ApplicationController
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
end
