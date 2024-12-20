class ProfilesController < ApplicationController
  def show
    @profile = Profile.includes(:user).find(params[:id])
  end
end
