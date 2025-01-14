class UsersController < ApplicationController
  def index
    @users = User.includes(:profile).where.not(id: current_user.id)
    @followees = current_user.followees
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    redirect_to root_path, status: :see_other
  end
end
