class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.user = current_user
    if @message.save
      redirect_to conversation_path(@conversation)
    else
      render "conversation/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
