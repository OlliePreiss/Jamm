class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def me
    @user = User.find(current_user.id)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to my_profile_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :name, :location, :ability, :commitment, :about, :sampleurl, :photourl)
  end

end
