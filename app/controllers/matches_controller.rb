# class MatchesController < ApplicationController
#   before_action :set_profile, only: [:ability, :commitment ]

#   def index
#     @profiles = User.unmatched_users(current_user).order('RANDOM()')
#   end

#   def approve
#     receiver_id = params[:profile_id]
#     match = current_user.sent_matches.find_or_initialize_by(receiver_id: receiver_id)
#     match.senderstatus = true
#     match.save!
#   end

#   def decline
#     receiver_id = params[:profile_id]
#     match = current_user.sent_matches.find_or_initialize_by(receiver_id: receiver_id)
#     match.senderstatus = false
#     match.save
#   end

#   private

#   def set_profile
#     @profile = User.find(params[:id])
#   end
# end

# app/controllers/matches_controller.rb
class MatchesController < ApplicationController
  def index
    @matches = Match.matches_for(current_user.id)
    @profiles = Match.reccomend_matches_for(current_user.id)
  end

  # if time refactor approve and decline as v similar

  def approve
    profile_id = params[:profile_id]
    match = Match.between(profile_id, current_user.id)
    # as don't know the order of profiles in match not using create doing custom method
    if match.present?
      match = match.first
      if match.sender_id == current_user.id
        match.senderstatus = true
      else
        match.receiverstatus = true
      end
    else
      match = Match.new(sender_id: current_user.id, receiver_id: profile_id, senderstatus: true)
    end
    if match.save!
      redirect_to matches_path
    end
  end

  def decline
    profile_id = params[:profile_id]
    match = Match.between(profile_id, current_user.id)

    # as don't know the order of profiles in match not using create doing custom method
    if match.present?
      match = match.first
      if match.sender_id == current_user.id
        match.senderstatus = false
      else
        match.receiverstatus = false
      end
    else

      match = Match.new(sender_id: current_user.id, receiver_id: profile_id, senderstatus: false)

    end

    Conversation.create(lastmessage: 'Test')
    if match.save!
      redirect_to matches_path
    end

  end
end
