class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
    @followees = current_user.followees
  end
end
