# this controller is not used for the mid-point check in
# to try move from having all sign up details on the Devise user sign-up page
# this controller is being user as a way to create customer routes/actions/views for each page

# class OnboardingsController < ApplicationController

#   before_action :set_user, only: [:ability, :commitment, :about, :update]

#   def ability
#   end

#   def commitment
#   end

#   def about
#   end

#   def abilityupdate
#     @user.update(user_params)
#     redirect_to onboarding_commitment_path(@user)
#   end

#   def commitmentupdate
#     @user.update(user_params)
#     redirect_to onboarding_about_path(@user)
#   end

#   def aboutupdate
#     @user.update(user_params)
#     # add browse user page here
#   end

#   private

#   def user_params
#     params.require(:user).permit(:email, :password, :name, :location, :ability, :commitment, :about, :sampleurl, :photourl)
#   end

#   def set_user
#     @user = User.find(params[:id])
#   end

# end
