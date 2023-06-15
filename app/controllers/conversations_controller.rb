class ConversationsController < ApplicationController
  def index
    matches = Match.matches_for_user(current_user.id)
    @conversations = matches.map(&:conversation)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end
end
