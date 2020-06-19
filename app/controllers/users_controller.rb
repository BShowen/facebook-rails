class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: user_params)
  end

  private
  def user_params
    params.require(:id)
  end
end
