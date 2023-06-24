class Match < ApplicationRecord

  belongs_to :sender, class_name: "User", foreign_key: 'sender_id'
  belongs_to :receiver, class_name: "User", foreign_key: 'receiver_id'
  has_one :conversation
  # belongs_to :conversation

  validates_uniqueness_of :sender_id, scope: :receiver_id
  after_save :create_conversation

  scope :between, -> (sender_id, receiver_id) do
    where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)", sender_id, receiver_id, receiver_id, sender_id)
  end

  scope :matches_for, -> id do
    matches = where("(sender_id = ? OR receiver_id = ?) AND (senderstatus = ? AND receiverstatus = ?)", id, id, true, true)

    profile_ids = []
    matches.each do |match|
      new_id = match.sender_id == id ? match.receiver_id : match.sender_id
      profile_ids << new_id
    end

    User.where(id: profile_ids)
  end

  scope :matches_for_user, -> id do
    where("(sender_id = ? OR receiver_id = ?) AND (senderstatus = ? AND receiverstatus = ?)", id, id, true, true)

    # profile_ids = []
    # matches.each do |match|
    #   new_id = match.sender_id == id ? match.receiver_id : match.sender_id
    #   profile_ids << new_id
    # end

    # User.where(id: profile_ids)
  end

  # for each user user.name
  # how we do create an array of conversations from the array of confirmed match. How do we create

#   scope :reccomend_matches_for, -> id do
#     # get account ids to ignore
#     matches = where("(sender_id = ? AND senderstatus IS NOT NULL) OR (receiver_id = ? AND receiverstatus IS NOT NULL )", id, id)

#     ignore_ids = [id]
#     matches.each do |match|
#       new_id = match.sender_id == id ? match.receiver_id : match.sender_id
#       ignore_ids << new_id
#     end

#     User.where.not(id: ignore_ids)
#   end

#   def create_conversation
#     Conversation.create!(match: self)
#   end

# end

  scope :reccomend_matches_for, ->(id) do
    user = User.find(id)
    ability_score = user.ability
    commitment_score = user.commitment

    # Get account IDs to ignore
    matches = where("(sender_id = ? AND senderstatus IS NOT NULL) OR (receiver_id = ? AND receiverstatus IS NOT NULL)", id, id)
    ignore_ids = [id]

    matches.each do |match|
      new_id = match.sender_id == id ? match.receiver_id : match.sender_id
      ignore_ids << new_id
    end

    # Filter users based on ability and commitment scores
    filtered_users = User.where.not(id: ignore_ids)
    if ability_score && commitment_score
      filtered_users = filtered_users.where("(ability BETWEEN ? AND ?) AND (commitment BETWEEN ? AND ?)",
                                            ability_score - 1, ability_score + 1, commitment_score - 1, commitment_score + 1)
    end

    filtered_users
  end
end
