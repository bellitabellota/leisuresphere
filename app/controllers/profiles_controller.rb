class ProfilesController < ApplicationController
  def show
    @profile = Profile.includes(:user).find(params[:id])
    @posts = @profile.user.posts.includes(:likers, { comments: { commenter: :profile } }).order(created_at: :desc)
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render edit:, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:birthday, :location, :interests, :avatar_url)
  end
end
