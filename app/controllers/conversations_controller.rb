class ConversationsController < ApplicationController
  def index
    matches = Match.where(sender: current_user).or(Match.where(receiver: current_user))
    @conversations = matches.map(&:conversation)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end
end
