class Conversation < ApplicationRecord
  has_many :messages
  has_many :messaging_timestamps
  belongs_to :match

  def unread_messages?(current_user:)
    latest_message_timestamp = messages.where.not(user: current_user).order(:created_at).last&.created_at ||
                               5.days.from_now
    messaging_timestamp = messaging_timestamps.where(action: "signout", user: current_user).first&.created_at ||
                          match.created_at
                          # raise
    latest_message_timestamp > messaging_timestamp
  end
end
