class ConversationsController < ApplicationController
  def index
    matches = Match.matches_for_user(current_user.id)
    @conversations = matches.map(&:conversation)
    # conversation_last_message = Conversation.find(params[:id])
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end
end
