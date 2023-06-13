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
      if Match.matches_for(current_user.id).include?(profile_id)
        redirect_to new_user_match_path(profile_id)
      else
        redirect_to matches_path
      end
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

  def new

  end

  def confirmed
    # Select all matches involving the current user where both users want to connect ("confirmed matches")
    matches = Match.where(sender_id: current_user.id)#.or(Match.where(receiver_id: current_user.id)).where(senderstatus: true, receiverstatus: true)

    # Identify the ID of the other user, who may be either the sender or receiver
    matchid = find_match_ids(matches)

    # Find all user objects who's IDs we have just found
    @users = find_users(matchid)
  end

  private

  def find_users(user_ids)
    users = []
    user_ids.each do |user_id|
      users.append(User.find(user_id))
    end
    return users
  end

  def find_match_ids(matches)
    matchid = []
    matches.each do |match|
      if match.sender_id == current_user.id
        matchid.append(match.receiver_id)
      else
        matchid.append(match.sender_id)
      end
    end
    return matchid
  end

end
