class MatchesController < ApplicationController
  before_action :set_profile, only: [:ability, :commitment ]

  def index
    @profiles = User.where.not(id: current_user)
  end

  def approve
  end

  def decline
  end

  private

  def set_profile
    @profile = User.find(params[:id])
  end
end
