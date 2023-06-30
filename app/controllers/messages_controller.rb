class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.user = current_user
    if @message.save
      # set_has_unread_messages_to_the_other_user(conversation: @conversation, message: @message)
      ConversationChannel.broadcast_to(
        @conversation,
        message: render_to_string(partial: "message", locals: { message: @message }),
        sender_id: current_user.id
      )
      head :ok
      # redirect_to conversation_path(@conversation)
    else
      render "conversation/show", status: :unprocessable_entity
    end
  end

  private

  def set_has_unread_messages_to_the_other_user(conversation:, message:)
    latest_message_timestamp = message.created_at
    messaging_timestamp = conversation
                          .messaging_timestamps
                          .where(action: "signout")
                          .where.not(user: current_user)
                          .first&.created_at ||
                          conversation.match.created_at
    has_unread_messages = latest_message_timestamp > messaging_timestamp
    conversation.match.conversations.update!(has_unread_messages:)
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
