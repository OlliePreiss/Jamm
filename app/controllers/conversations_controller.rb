class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.where?
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end


end
