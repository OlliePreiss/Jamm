class MessagingTimestampsController < ApplicationController
  def subscribe
    timestamp = MessagingTimestamp.new
    timestamp.conversation = Conversation.find(params[:conversation_id])
    timestamp.user = current_user
    timestamp.action = "signin"
    MessagingTimestamp.where(user: current_user, action: "signout").destroy_all if timestamp.save
  end

  def unsubscribe
    timestamp = MessagingTimestamp.new
    timestamp.conversation = Conversation.find(params[:conversation_id])
    timestamp.user = current_user
    timestamp.action = "signout"
    MessagingTimestamp.where(user: current_user, action: "signin").destroy_all if timestamp.save
    # redirect_to timestamp.conversation
  end
end
