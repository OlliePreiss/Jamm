import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"


// Connects to data-controller="conversation-subscription"
export default class extends Controller {
  static values = { conversationId: Number}
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ConversationChannel", id: this.conversationIdValue },

      {received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data)},

      { received: data => console.log(data) }
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
}
