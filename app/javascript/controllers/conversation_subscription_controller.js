import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"


// Connects to data-controller="conversation-subscription"
export default class extends Controller {
  static values = { conversationId: Number, currentUserId: Number}
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ConversationChannel", id: this.conversationIdValue },

      {received: data => {
        const currentUserIsSender = this.currentUserIdValue === data.sender_id
        const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)
        console.log(messageElement)
        this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
        this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
      }}
    )
    $.ajax({
      url: "/messaging_timestamps/subscribe",
      data: {
        conversation_id: this.conversationIdValue
      }
    })
  }

  disconnect(){
    console.log('disconnected')
    $.ajax({
      url: "/messaging_timestamps/unsubscribe",
      data: {
        conversation_id: this.conversationIdValue
      }
    })
  }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#userStyleClass(currentUserIsSender)}">
        <p>${message}</p>
      </div>
    `
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "my-message-box" : "match-message-box"
  }
}
